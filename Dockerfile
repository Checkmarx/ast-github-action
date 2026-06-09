# Use AST Base image
FROM checkmarx/ast-cli:2.3.52@sha256:1c602a5b152ef67e428bab987460b7c15472a2bbf62eafcd42d76bb873478144

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
