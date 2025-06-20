# Use AST Base image
FROM checkmarx/ast-cli:2.3.25@sha256:832b464fedc2d5da30ff9952e96f601a7b9179b84b957d028f29050f4200e2cd

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
