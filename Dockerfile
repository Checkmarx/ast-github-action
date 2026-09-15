# Use AST Base image
FROM checkmarx/ast-cli:2.3.65@sha256:c537541a86f1651caaafdcf6bdfbc6a5b0fc26dda6a7115718951aea284c3aeb

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY scripts /app/scripts/
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh \
    && chmod +x /app/scripts/


HEALTHCHECK NONE
