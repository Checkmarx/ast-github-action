# Use AST Base image
FROM checkmarx/ast-cli:2.3.66@sha256:adba53d3542a6b98042daf3552a84d75eedb55404f0b22725a7fd7b4b922bf18

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
