#!/bin/bash

output_file=./output.log

eval "arr=(${ADDITIONAL_PARAMS})"
/app/bin/cx scan create --project-name "${PROJECT_NAME}" -s "." --branch "${BRANCH#refs/heads/}" --scan-info-format json --agent "Github Action" "${arr[@]}" | tee -i $output_file
exitCode=${PIPESTATUS[0]}

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
