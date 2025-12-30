# Use AST Base image
FROM checkmarx/ast-cli:2.3.42@sha256:ed7b056c130994ad5d2aa296c8b34e3ef74bd9de6804c8054aef0940dbf2cb4e

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
