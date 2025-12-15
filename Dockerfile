# Use AST Base image
FROM checkmarx/ast-cli:2.3.39@sha256:0b60b4762ed93556479e360a945ae789d2222286aad7b4048899943c97b6d7dd

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
