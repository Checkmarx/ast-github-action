# Use AST Base image
FROM checkmarx/ast-cli:2.3.40@sha256:55ba02e51fc441e7edbfc8e22dff44c5d5af778aef24eeea68debba6fb26f79d

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
