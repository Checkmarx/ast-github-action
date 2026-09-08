# Use AST Base image
FROM checkmarx/ast-cli:2.3.64@sha256:40e8bc8b8b7af723b3c3405b3a1914afd3f58fa30ac802c6cf1686b552654571

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
