# Use AST Base image
FROM checkmarx/ast-cli:2.3.33@sha256:4288a8ddbc90e8d1f76ff1efadd5700be14ca046f5950e3593fa80d2b45d5ee1

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
