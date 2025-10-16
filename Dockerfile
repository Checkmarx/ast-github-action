# Use AST Base image
FROM checkmarx/ast-cli:2.3.38@sha256:f7b6262642f8eb2fd42397fab00e4da5a6599955e3f6cf818e2a767d9255c3be

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
