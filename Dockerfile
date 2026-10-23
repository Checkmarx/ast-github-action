# Use AST Base image
FROM checkmarx/ast-cli:2.3.68@sha256:b53719f0c91ad2076feb78e3dc7a295638f8f646bbfa99c18efcdefef4449754

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
