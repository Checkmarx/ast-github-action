# Use AST Base image
FROM anjalideore/checkmarx-test:latest@sha256:7bf652f8b165dd650e70073aa08a1fa16600e1018976c6c163a74c16527438ac

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
