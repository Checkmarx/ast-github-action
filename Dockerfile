# Use AST Base image
FROM checkmarx/ast-cli:2.3.24@sha256:a9f8d4d6452976807bafbca8553b9ceeb0ba5810ad9be2edeeaa313c05ce84b5

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
