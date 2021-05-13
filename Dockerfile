#Use AST Base image
FROM cxsdlc/ast-cli
#Apply any updates
RUN apk update && apk upgrade
RUN apk add bash
#Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
