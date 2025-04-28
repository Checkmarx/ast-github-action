# Use AST Base image
FROM checkmarx/ast-cli:2.3.20@sha256:92eddcc71d0fd37b040e976d205ef6a7d30fac746d9d8e2443022a38757d9460

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
