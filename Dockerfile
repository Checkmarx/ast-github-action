#Use AST Base image
FROM checkmarx/dev-tests:latest

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

USER root