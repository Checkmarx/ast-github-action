# Use AST Base image
FROM checkmarx/ast-cli:2.3.21@sha256:b20df97e36a0938ac404f5ac70ad02871547f0f9a9f2e54ad542505db511c7bf

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
