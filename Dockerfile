# Use AST Base image
FROM checkmarx/ast-cli:2.3.13@sha256:5b1898f68eb3699e591f1170c7c1936fbaa60c6b110e0e2a921ac5508083ddae

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
