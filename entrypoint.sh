#!/bin/sh

OUTPUT=$(/app/bin/cx scan create -v --scan-types "${SCAN_TYPES}" --project-name "${PROJECT_NAME}" -d "." --filter "${FILTER}" --preset-name "${PRESET_NAME}" --format json --agent "Github Action" ${ADDITIONAL_PARAMS})

echo $OUTPUT

echo "::set-output name=output::$OUTPUT"