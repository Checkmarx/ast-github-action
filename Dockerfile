#Use AST Base image
FROM jprannoyn474/astclitest
#Apply any updates
RUN apk update && apk upgrade
#Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
#RUN cx --client-id ${CLIENT_ID} --secret ${SECRET} --base-uri ${BASE_URI} --format json scan create --project_type ${PROJECT_TYPE} --project_name ${PROJECT_NAME} -s ${ARCHIVE_SOURCE} -d ${PROJECT_SOURCE}