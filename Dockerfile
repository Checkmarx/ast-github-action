# Use AST Base image
FROM checkmarx/ast-cli:2.3.32@sha256:a982ad89d574cec96d0c4b76dd2a23dc1934f74dc1f49b5d1bb200599ec8ec74

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
