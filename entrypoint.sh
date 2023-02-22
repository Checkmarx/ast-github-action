#!/bin/bash

output_file=./output.log

eval "arr=(${ADDITIONAL_PARAMS})"
/app/bin/cx scan create --project-name "${PROJECT_NAME}" -s "." --branch "${BRANCH#refs/heads/}" --scan-info-format json --agent "Github Action" "${arr[@]}" | tee -i $output_file
exitCode=${PIPESTATUS[0]}

scanId=(`grep -E '"(ID)":"((\\"|[^"])*)"' $output_file | cut -d',' -f1 | cut -d':' -f2 | tr -d '"'`)

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
  echo "Scan completed" >> $GITHUB_OUTPUT
else
  echo "Scan Failed" >> $GITHUB_OUTPUT
  exit $exitCode
fi

