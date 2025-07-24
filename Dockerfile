# Use AST Base image
FROM checkmarx/ast-cli:2.3.28@sha256:c4e9e9c89d3167bb4ce97ac19baecba4e68e3b587d6d798259039e786324f8cb

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
