#Use CxFlow Base image
FROM jprannoyn474/ast-cli-test
#Apply any updates
RUN apk update && apk upgrade
#Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]