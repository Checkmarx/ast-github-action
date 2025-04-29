# Use AST Base image
FROM anjalideore/checkmarx-test@sha256:58446308874759e49f213b18f0186f714b18d0a829515ccd653b0a7f266e3681
# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
