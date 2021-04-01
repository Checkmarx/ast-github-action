#!/bin/sh
#/app/bin/cx --client-id ${CLIENT_ID} --secret ${SECRET} --base-uri ${BASE_URI} --format json scan create --project-type ${PROJECT_TYPE} --project-name ${PROJECT_NAME} -d ${SOURCE_DIRECTORY} --filter ${FILTER}
/app/bin/cx scan create  -v --base-uri ${BASE_URI} --project-name ${PROJECT_NAME} -d ${SOURCE_DIRECTORY}
if [[ -v ${FILTER} ]]; then
  --filter ${FILTER}
fi
if [[ -v ${CLIENT_ID} ]]; then
  --client-id ${CLIENT_ID}
fi
if [[ -v ${SECRET} ]]; then
  "--secret" ${SECRET}
fi
if [[ -v ${PROJECT_TYPE} ]]; then
  "--project-type" ${PROJECT_TYPE}
fi