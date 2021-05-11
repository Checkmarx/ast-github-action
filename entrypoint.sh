#!/bin/sh

cxscan="$(/app/bin/cx scan create -v --scan-types "${SCAN_TYPES}" --project-name "${PROJECT_NAME}" -d "." --filter "${FILTER}" --preset-name "${PRESET_NAME}" --format json --agent "Github Action" ${ADDITIONAL_PARAMS})"

echo "$cxscan"

cxscan="${cxscan//'%'/'%25'}"
cxscan="${cxscan//$'\n'/'%0A'}"
cxscan="${cxscan//$'\r'/'%0D'}"
echo "::set-output name=cxcli::$cxscan"