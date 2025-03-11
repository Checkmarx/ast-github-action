# Use AST Base image
FROM checkmarx/ast-cli:2.3.16@sha256:d2ee240afd7018599ab5f0816e82707fc42bdb1a185e16ddb8bb7d791789074e

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
