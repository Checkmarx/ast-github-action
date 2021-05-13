#!/bin/sh

#param= echo "--sast-preset-name \"Jay\""|sed 's@\\@@g'
#echo $param

#param= "${ADDITIONAL_PARAMS}"|sed 's@\\@@g'
#echo $param
cxscan="$(/app/bin/cx scan create -v --scan-types "${SCAN_TYPES}" --project-name "${PROJECT_NAME}" -d "." --filter "${FILTER}" --format json --agent "Github Action" '$ADDITIONAL_PARAMS')"

<<<<<<< HEAD
=======
cxscan="$(/app/bin/cx scan create -v --scan-types "${SCAN_TYPES}" --project-name "${PROJECT_NAME}" -d "." --filter "${FILTER}" --format json --agent "Github Action" ""${ADDITIONAL_PARAMS}"|sed 's@\\@@g'")"
>>>>>>> 18d3413 (Additional parameter)

echo "$cxscan"

cxscan="${cxscan//'%'/'%25'}"
cxscan="${cxscan//$'\n'/'%0A'}"
cxscan="${cxscan//$'\r'/'%0D'}"
echo "::set-output name=cxcli::$cxscan"
