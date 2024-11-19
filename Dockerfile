# Use AST Base image
FROM checkmarx/ast-cli:2.3.5@sha256:af9222f9be2c79738cf2e1d33a0e8da566e879d7

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh
