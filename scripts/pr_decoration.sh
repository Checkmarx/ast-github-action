#!/bin/bash

# ------------------------------------------------------
# Logic: PR Decoration
# ------------------------------------------------------

# Parse utils-specific params
if [ -n "${UTILS_PARAMS}" ]; then
  eval "utils_arr=(${UTILS_PARAMS})"
else
  utils_arr=()
fi

combined_utils_params=("${global_arr[@]}" "${utils_arr[@]}")

# Detect if customer manually set code-repository-url
USER_PROVIDED_CODE_REPO_URL=false
for param in "${combined_utils_params[@]}"; do
  if [[ "$param" == "--code-repository-url" ]] || [[ "$param" == --code-repository-url=* ]]; then
    USER_PROVIDED_CODE_REPO_URL=true
    break
  fi
done

if [ -n "$scanId" ] && [ -n "${PR_NUMBER}" ]; then
  echo "Creating PR decoration for scan ID: $scanId"

  # Build base command
  base_cmd=(
    /app/bin/cx utils pr github
    --scan-id "${scanId}"
    --namespace "${NAMESPACE}"
    --repo-name "${REPO_NAME}"
    --pr-number "${PR_NUMBER}"
    --token "${GITHUB_TOKEN}"
  )

  # 1. If user manually provided --code-repository-url, use it exactly as-is
  if [ "$USER_PROVIDED_CODE_REPO_URL" = true  ]; then
    echo "User provided custom --code-repository-url. Using it."

  # 2. Else if on-prem server (IS_CLOUD=false), add our default on-prem URL
  elif [ "$IS_CLOUD" = false ]; then
    echo "Detected On-Prem GitHub. Adding default code-repository-url."
    base_cmd+=(--code-repository-url "${GITHUB_SERVER_URL}")

  # 3. Else Cloud,do nothing
  else
    echo "GitHub Cloud detected. No extra code-repository-url needed."
  fi

  # Append ALL utils parameters (including user's custom params)
  base_cmd+=("${combined_utils_params[@]}")

  # Execute
  "${base_cmd[@]}"

else
  echo "PR decoration not created"
fi
