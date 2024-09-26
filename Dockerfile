#Use AST Base image
FROM checkmarx/dev-tests:latest

RUN touch /app/output.log

# Copy the entrypoint script and properties used for the action
COPY --chmod=555 entrypoint.sh /app/entrypoint.sh
COPY --chmod=555 cleanup.sh /app/cleanup.sh

USER 65532