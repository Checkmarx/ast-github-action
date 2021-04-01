#!/bin/sh
#/app/bin/cx --client-id ${CLIENT_ID} --secret ${SECRET} --base-uri ${BASE_URI} --format json scan create --project-type ${PROJECT_TYPE} --project-name ${PROJECT_NAME} -d ${SOURCE_DIRECTORY} --filter ${FILTER}
/app/bin/cx scan create  -v --base-uri ${BASE_URI} --project-name ${PROJECT_NAME} -d ${SOURCE_DIRECTORY}
if [[ -v ${FILTER} ]]; then
  echo "--filter ${FILTER}"
fi
if [[ -v ${CLIENT_ID} ]]; then
  echo "--client-id ${CLIENT_ID}"
fi
if [[ -v ${SECRET} ]]; then
  echo "--secret ${SECRET}"
fi
if [[ -v ${PROJECT_TYPE} ]]; then
  echo "--project-type ${PROJECT_TYPE}"
fi