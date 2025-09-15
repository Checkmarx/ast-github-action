# Use AST Base image
FROM checkmarx/ast-cli:2.3.35@sha256:5162530c0810ffce10756b1b86006f5c28c7e8d6a381986f60e1ec51a5629c98

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
