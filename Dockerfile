# Use AST Base image
FROM checkmarx/ast-cli:2.2.7

# Copy the entrypoint script and properties used for the action
COPY --chmod=500 entrypoint.sh /app/entrypoint.sh
COPY --chmod=500 cleanup.sh /app/cleanup.sh

# Docker actions must be run by the default Docker user (root).
USER root