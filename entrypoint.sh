#!/bin/sh
printenv
/app/bin/cx version
/app/bin/cx scan create -v --project-type ${PROJECT_TYPE} --project-name ${PROJECT_NAME} -d "." --filter ${FILTER} --format json