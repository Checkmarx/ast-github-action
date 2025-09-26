# Use AST Base image
FROM checkmarx/ast-cli:2.3.36@sha256:bb2cc2dd3f24bf19f8a02aae8d71dd00bafa3eb13bffeb9e685e34302cb30af4

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
