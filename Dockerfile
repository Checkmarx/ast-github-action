# Use AST Base image
FROM checkmarx/ast-cli:2.3.63@sha256:76915c053671e722dcce735bd18a1e7725c4a2bd21b6d4a443ba1591a2813735

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
