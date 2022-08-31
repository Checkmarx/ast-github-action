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

echo "# Checkmarx scan 🔒" >> $GITHUB_STEP_SUMMARY
echo "Program exits with code: " $exitCode >> $GITHUB_STEP_SUMMARY

if [ -n "$scanId" ]; then
  echo "🔗 ScanId: $scanId" >> $GITHUB_STEP_SUMMARY
fi

if [ $exitCode -eq 0 ]
then
  echo "Scan completed" >> $GITHUB_STEP_SUMMARY
else
  echo "Scan Failed" >> $GITHUB_STEP_SUMMARY
  exit $exitCode
fi

