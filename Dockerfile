# Use AST Base image
FROM checkmarx/ast-cli:2.3.59@sha256:92102e087def76f9bfd3af5e8e153bd43a0f5499f118c317151e10f564ecf67a

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
