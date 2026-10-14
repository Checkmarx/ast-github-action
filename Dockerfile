# Use AST Base image
FROM checkmarx/ast-cli:2.3.67@sha256:f9aece17f331c36cb6c5895d4c29c652f7a624c0f8256afefbc2420cf9d2be0e

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
