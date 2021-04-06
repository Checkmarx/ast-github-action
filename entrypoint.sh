#!/bin/sh
printenv
/app/bin/cx scan create --project-type ${PROJECT_TYPE} --project-name ${PROJECT_NAME} -d "." --filter ${FILTER} --format json