#!/bin/bash

echo "Starting the application..."
echo "Environment variables:" $@
echo "Branch ref: " ${BRANCH#refs/heads/}
echo "Branch name: " ${BRANCH}
echo "Branch from github: " ${GITHUB_HEAD_REF}

eval "arr=(${ADDITIONAL_PARAMS})"
/app/bin/cx scan create --project-name "${PROJECT_NAME}" -s "." --branch "${BRANCH#refs/heads/:-${GITHUB_HEAD_REF}}" --scan-info-format json --agent "Github Action" "${arr[@]}" | tee -i ./output.log
exitCode=${PIPESTATUS[0]}

echo "Program exits with code: " $exitCode
if [ $exitCode -eq 0 ]
then
  echo "Scan completed"
else
  echo "Scan Failed"
  exit $exitCode
fi
