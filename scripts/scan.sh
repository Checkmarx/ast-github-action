#!/bin/bash

# ------------------------------------------------------
# Logic: Parse Params and Run Scan
# ------------------------------------------------------

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

# Backward compatibility: Support ADDITIONAL_PARAMS
if [ -n "${ADDITIONAL_PARAMS}" ] && [ -z "${SCAN_PARAMS}" ]; then
  echo "⚠️  ADDITIONAL_PARAMS is deprecated. Please use SCAN_PARAMS instead."
  eval "scan_arr=(${ADDITIONAL_PARAMS})"
fi

# Combine global + scan-specific params
combined_scan_params=("${global_arr[@]}" "${scan_arr[@]}")

# Execute Scan
/app/bin/cx scan create --project-name "${PROJECT_NAME}" -s "${SOURCE_DIR}" --branch "${BRANCH#refs/heads/}" --scan-info-format json --agent "Github Action" "${combined_scan_params[@]}" | tee -i "$output_file"
exitCode=${PIPESTATUS[0]}

# Extract Scan ID
scanId=(`grep -E '"(ID)":"((\\"|[^"])*)"' "$output_file" | cut -d',' -f1 | cut -d':' -f2 | tr -d '"'`)

# Output for GitHub Actions
echo "cxcli=$(cat "$output_file" | tr -d '\r\n')" >> $GITHUB_OUTPUT
