#!/bin/sh

echo $ADDITIONAL_PARAMS
#ADDITIONAL_PARAMS_ARR=($ADDITIONAL_PARAMS)

cxscan="$(/app/bin/cx scan create -v --scan-types "${SCAN_TYPES}" --project-name "${PROJECT_NAME}" -d "." --filter "${FILTER}" --format json --agent "Github Action" ${ADDITIONAL_PARAMS[@]})"

echo "$cxscan"

cxscan="${cxscan//'%'/'%25'}"
cxscan="${cxscan//$'\n'/'%0A'}"
cxscan="${cxscan//$'\r'/'%0D'}"
echo "::set-output name=cxcli::$cxscan"
