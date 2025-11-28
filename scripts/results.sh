#!/bin/bash

# ------------------------------------------------------
# Logic: Generate Results/Report
# ------------------------------------------------------

if [ -n "$scanId" ]; then
  # Parse results-specific params
  if [ -n "${RESULTS_PARAMS}" ]; then
    eval "results_arr=(${RESULTS_PARAMS})"
  else
    results_arr=()
  fi

  # Combine global + results-specific params
  combined_results_params=("${global_arr[@]}" "${results_arr[@]}")

  /app/bin/cx results show --scan-id "${scanId}" --report-format markdown "${combined_results_params[@]}"
  
  cat ./cx_result.md >$GITHUB_STEP_SUMMARY
  rm ./cx_result.md
  
  echo "cxScanID=$scanId" >> $GITHUB_OUTPUT
fi
