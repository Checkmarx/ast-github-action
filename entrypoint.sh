#!/bin/bash

eval "arr=(${ADDITIONAL_PARAMS})"
/app/bin/cx scan create -v --project-name "${PROJECT_NAME}" -s "." --filter "${FILTER}" --branch "${BRANCH#refs/heads/}" --format json --agent "Github Action" "${arr[@]}"
exitCode=$?

echo "Program exits with code: " $exitCode
if [ $exitCode -eq 0 ]
then
  echo "Scan completed"
else
  echo "Scan Failed"
  exit $exitCode
fi