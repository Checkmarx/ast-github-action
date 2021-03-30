#!/bin/sh
jprannoyn474/ast-cli-test:latest --client-id ${CLIENT_ID} --secret ${SECRET} --base-uri ${BASE_URI} --format json scan create --project_type ${PROJECT_TYPE} --project_name ${PROJECT_NAME} -s ${ARCHIVE_SOURCE} -d ${PROJECT_SOURCE}
