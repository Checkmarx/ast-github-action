#Use AST Base image
FROM cxsdlc/ast-cli

#Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
