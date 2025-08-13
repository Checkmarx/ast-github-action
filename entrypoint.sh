#!/bin/bash
set -e

output_file=./output.log

# ------------------------------------------------------
# Multi-registry auth.json creation
# ------------------------------------------------------
# Expected env vars:
# REGISTRIES="docker.io ghcr.io registry.example.com"
# USERNAME_<REGISTRY> and PASSWORD_<REGISTRY>
# Example: USERNAME_DOCKER_IO, PASSWORD_DOCKER_IO
#          USERNAME_GHCR_IO, PASSWORD_GHCR_IO

if [[ -n "$REGISTRIES" ]]; then
    echo "🔑 Creating multi-registry auth.json..."
    mkdir -p /github/home/.config/containers
    auths_entries=""

    for reg in $REGISTRIES; do
        # Convert registry to env var friendly form (dots & dashes to underscores, uppercase)
        env_suffix=$(echo "$reg" | tr '.-' '_' | tr '[:lower:]' '[:upper:]')

        user_var="USERNAME_${env_suffix}"
        pass_var="PASSWORD_${env_suffix}"

        user="${!user_var}"
        pass="${!pass_var}"

        if [[ -n "$user" && -n "$pass" ]]; then
            encoded=$(echo -n "${user}:${pass}" | base64 -w0)
            auths_entries+="\"$reg\": {\"auth\": \"$encoded\"},"
            echo "✅ Added credentials for $reg"
        else
            echo "⚠️  Skipping $reg — missing username/password"
        fi
    done

    # Remove trailing comma and wrap in JSON
    auths_entries="${auths_entries%,}"
    echo "{\"auths\": {${auths_entries}}}" > /github/home/.config/containers/auth.json
    echo "✅ Auth.json created at /github/home/.config/containers/auth.json"
else
    echo "⚠️  No REGISTRIES specified, skipping auth.json creation."
fi
# ------------------------------------------------------

# Parse additional params into array
eval "arr=(${ADDITIONAL_PARAMS})"
/app/bin/cx scan create --project-name "${PROJECT_NAME}" -s "${SOURCE_DIR}" --branch "${BRANCH#refs/heads/}" --scan-info-format json --agent "Github Action" "${arr[@]}" | tee -i $output_file
exitCode=${PIPESTATUS[0]}

scanId=(`grep -E '"(ID)":"((\\"|[^"])*)"' $output_file | cut -d',' -f1 | cut -d':' -f2 | tr -d '"'`)

echo "cxcli=$(cat $output_file | tr -d '\r\n')" >> $GITHUB_OUTPUT

if [ -n "$scanId" ] && [ -n "${PR_NUMBER}" ]; then
  echo "Creating PR decoration for scan ID:" $scanId
  /app/bin/cx utils pr github --scan-id "${scanId}" --namespace "${NAMESPACE}" --repo-name "${REPO_NAME}" --pr-number "${PR_NUMBER}" --token "${GITHUB_TOKEN}"
else
  echo "PR decoration not created."
fi


if [ -n "$scanId" ]; then
  /app/bin/cx results show --scan-id "${scanId}" --report-format markdown
  cat ./cx_result.md >$GITHUB_STEP_SUMMARY
  rm ./cx_result.md
  echo "cxScanID=$scanId" >> $GITHUB_OUTPUT
fi

if [ $exitCode -eq 0 ]
then
  echo "Scan completed"
else
  echo "Scan failed"
  exit $exitCode
fi