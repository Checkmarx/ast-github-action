#!/bin/bash

eval "arr=(${ADDITIONAL_PARAMS})"
/app/bin/cx scan create --project-name "${PROJECT_NAME}" -s "." --branch "${GITHUB_HEAD_REF:-${BRANCH#refs/heads/}}" --scan-info-format json --agent "Github Action" "${arr[@]}" | tee -i /tmp/output.file
exitCode=$?

echo "Program exits with code: " $exitCode
if [ $exitCode -eq 0 ]
then
  echo "Scan completed"
else
  echo "Scan Failed"
  exit $exitCode
fi
