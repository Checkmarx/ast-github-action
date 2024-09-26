#Use AST Base image
FROM checkmarx/dev-tests:latest

# Copy the entrypoint script and properties used for the action
COPY --chown=555 entrypoint.sh /app/entrypoint.sh
COPY --chown=555 cleanup.sh /app/cleanup.sh

USER 65532