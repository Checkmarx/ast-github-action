# Use AST Base image
FROM checkmarx/ast-cli:2.3.27@sha256:13379f519e7a0dee4ed18ef7b55c2dfdba733a7e90a77fa771d6a460da001515

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
