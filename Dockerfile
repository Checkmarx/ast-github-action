# Use AST Base image
FROM checkmarx/ast-cli:2.3.44@sha256:9ecd8c6fed490e4ff897d34425e55adba54583d803722b93943021c3f882c5cb

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
