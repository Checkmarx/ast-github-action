# Use AST Base image
FROM anjalideore/checkmarx-test:latest@sha256:3b5ccbcc6f245de861849b8fade60df3cf5b10a3611629d25f0166c1502cb43a

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
