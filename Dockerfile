# Use AST Base image
FROM checkmarx/ast-cli:2.3.11@sha256:7b235a9fe3ed2dc3f96d8a7a21b24d82f4cd4b37e501ea62893a0acebe1d018c

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
