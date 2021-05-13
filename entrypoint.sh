#!/bin/bash

arr=($ADDITIONAL_PARAMS)
cxscan=""
/app/bin/cx scan create -v --scan-types "${SCAN_TYPES}" --project-name "${PROJECT_NAME}" -d "." --filter "${FILTER}" --format json --agent "Github Action" ${arr[@]}
echo "$cxscan"

cxscan="${cxscan//'%'/'%25'}"
cxscan="${cxscan//$'\n'/'%0A'}"
cxscan="${cxscan//$'\r'/'%0D'}"
echo "::set-output name=cxcli::$cxscan"
