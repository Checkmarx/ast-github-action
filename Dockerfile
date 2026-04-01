# Use AST Base image
FROM checkmarx/ast-cli:2.3.48@sha256:adb0a1bf4a871fdd6553728e3efbca5784fd9ee12aedf03a96b342a6db7dda57

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
