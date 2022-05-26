#!/bin/bash

BRANCH_VAL = ${BRANCH}
if [ -z "$BRANCH_VAL" ]
  then
    BRANCH_VAL = ${GITHUB_HEAD_REF}
  ELSE
    BRANCH_VAL = ${BRANCH}
fi

eval "arr=(${ADDITIONAL_PARAMS})"
/app/bin/cx scan create --project-name "${PROJECT_NAME}" -s "." --branch "${BRANCH_VAL}" --scan-info-format json --agent "Github Action" "${arr[@]}" | tee -i ./output.log
exitCode=${PIPESTATUS[0]}

echo "Program exits with code: " $exitCode
if [ $exitCode -eq 0 ]
then
  echo "Scan completed"
else
  echo "Scan Failed"
  exit $exitCode
fi
