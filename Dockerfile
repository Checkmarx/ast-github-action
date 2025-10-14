# Use AST Base image
FROM checkmarx/ast-cli:2.3.37@sha256:c69bcedc9dec7e533014946c3d62b7e12acfddd6766c03e28ee1d3e5ab230ee9

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
