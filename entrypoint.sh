#!/bin/bash

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

# Parse global params (applied to all commands)
if [ -n "${GLOBAL_PARAMS}" ]; then
  eval "global_arr=(${GLOBAL_PARAMS})"
else
  global_arr=()
fi

# Parse scan-specific params
if [ -n "${SCAN_PARAMS}" ]; then
  eval "scan_arr=(${SCAN_PARAMS})"
else
  scan_arr=()
fi

# Parse utils-specific params
if [ -n "${UTILS_PARAMS}" ]; then
  eval "utils_arr=(${UTILS_PARAMS})"
else
  utils_arr=()
fi

# Parse results-specific params
if [ -n "${RESULTS_PARAMS}" ]; then
  eval "results_arr=(${RESULTS_PARAMS})"
else
  results_arr=()
fi

# Backward compatibility: Support ADDITIONAL_PARAMS
if [ -n "${ADDITIONAL_PARAMS}" ] && [ -z "${SCAN_PARAMS}" ]; then
  echo "⚠️  ADDITIONAL_PARAMS is deprecated. Please use SCAN_PARAMS instead."
  eval "scan_arr=(${ADDITIONAL_PARAMS})"
fi

# Combine global + scan-specific params
combined_scan_params=("${global_arr[@]}" "${scan_arr[@]}")


/app/bin/cx scan create --project-name "${PROJECT_NAME}" -s "${SOURCE_DIR}" --branch "${BRANCH#refs/heads/}" --scan-info-format json --agent "Github Action" "${combined_scan_params[@]}" | tee -i $output_file
exitCode=${PIPESTATUS[0]}

scanId=(`grep -E '"(ID)":"((\\"|[^"])*)"' $output_file | cut -d',' -f1 | cut -d':' -f2 | tr -d '"'`)

echo "cxcli=$(cat $output_file | tr -d '\r\n')" >> $GITHUB_OUTPUT

if [ -n "$scanId" ] && [ -n "${PR_NUMBER}" ]; then
  echo "Creating PR decoration for scan ID:" $scanId
  # Combine global + utils-specific params
  combined_utils_params=("${global_arr[@]}" "${utils_arr[@]}")
  /app/bin/cx utils pr github --scan-id "${scanId}" --namespace "${NAMESPACE}" --repo-name "${REPO_NAME}" --pr-number "${PR_NUMBER}" --token "${GITHUB_TOKEN}" "${combined_utils_params[@]}"
else
  echo "PR decoration not created."
fi


if [ -n "$scanId" ]; then
  # Combine global + results-specific params
  combined_results_params=("${global_arr[@]}" "${results_arr[@]}")
  /app/bin/cx results show --scan-id "${scanId}" --report-format markdown "${combined_results_params[@]}"
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