# Use AST Base image
FROM checkmarx/ast-cli:2.3.14@sha256:818f4b8ae2277f224e420d96e43374c4d330d982ab546cd3240df2aee4abbeac

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
