# Use AST Base image
FROM checkmarx/ast-cli:2.3.41@sha256:6eb696e1a1bcc45d7f980763f08f97ab7780e447604f34e83145ad064752ab72

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
