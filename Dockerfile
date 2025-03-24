# Use AST Base image
FROM checkmarx/ast-cli:2.3.17@sha256:e8cdae45b3d2757263df8acd96cbc09dd1605da84d27ca22a1d2cdd2e7db09ac

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
