# Use AST Base image
FROM checkmarx/ast-cli:2.3.45@sha256:7249cf287afc7f17c0c634e043379f002a07fa06007bf03dfbc537f4b1f873f4

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
