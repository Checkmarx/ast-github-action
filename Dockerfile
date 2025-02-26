# Use AST Base image
FROM checkmarx/ast-cli:2.3.15@sha256:2b5337a25f459229613384dfe8b2d249ceeafefb3c14af3048be873e83907e7a

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
