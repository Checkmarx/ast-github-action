#!/bin/sh
printenv
/app/bin/cx scan create -v --project-type "${PROJECT_TYPE}" --project-name "${PROJECT_NAME}" -d "." --filter "${FILTER}" --preset-name "${PRESET_NAME}" --format json