# Use AST Base image
FROM checkmarx/ast-cli:2.3.60@sha256:ed98724a7a971034b9224eca19e5dca5fad3e1f3dc1624f301a9b766c446d210

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
