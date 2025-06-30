# Use AST Base image
FROM checkmarx/ast-cli:2.3.26@sha256:15a3f4ef7f17e1a624f7e64f4930c90a8d117d66f68ef19ea6a783d4a7fcf150

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
