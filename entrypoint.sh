#!/bin/bash

output_file=./output.log

eval "arr=(${ADDITIONAL_PARAMS})"
/app/bin/cx scan create --project-name "${PROJECT_NAME}" -s "." --branch "${BRANCH#refs/heads/}" --scan-info-format json --agent "Github Action" "${arr[@]}" | tee -i $output_file
exitCode=${PIPESTATUS[0]}

scanId=(`grep -E '"(ID)":"((\\"|[^"])*)"' $output_file | cut -d',' -f1 | cut -d':' -f2 | tr -d '"'`)
if [ -z "$scanId" ]
then
  echo "Scan not created. Terminating PR decoration job."
else
  if [ -z "${PR_NUMBER}" ]
    then
      echo "PR NUMBER not received to create decoration."
    else
      echo "Creating PR decoration for scan ID:" $scanId
      /app/bin/cx utils pr github --scan-id "${scanId}" --namespace "${NAMESPACE}" --repo-name "${REPO_NAME}" --pr-number "${PR_NUMBER}" --token "${GITHUB_TOKEN}"
  fi
fi

echo "Program exits with code: " $exitCode
if [ $exitCode -eq 0 ]
then
  echo "Scan completed"
else
  echo "Scan Failed"
  exit $exitCode
fi

scan_url=$(grep -oE 'https://(.+)' < $output_file)

echo "# Checkmarx scan 🔒" >> $GITHUB_STEP_SUMMARY
echo "🔗 [View results]($scan_url)" >> $GITHUB_STEP_SUMMARY
