# Use AST Base image
FROM checkmarx/ast-cli:2.3.29@sha256:f3357340fd0531ddb3d0650060df7432c6aa5d58ffd9d618d6cf91801183abd7

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
