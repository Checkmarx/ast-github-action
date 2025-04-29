# Use AST Base image
FROM anjalideore/checkmarx-test:latest@sha256:050abca285663f59a09c8a571c2ea06ffcb2f44418f8b179f140e9cfc16e6f48

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
