# Use AST Base image
FROM anjalideore/checkmarx-test:latest@sha256:715e817a00fcfc4cc5c4ed72debb4a6f9b38b22348e36f190e4a1f985cc7661e
# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
