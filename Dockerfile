# Use AST Base image
FROM checkmarx/ast-cli:2.3.34@sha256:ce59ac46875be675082e9e9a470ce7696aa4ffde06e1b6e72d8b9dbc176ae4b8

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
