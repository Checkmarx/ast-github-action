# Use AST Base image
FROM anjalideore/checkmarx-test:latest@sha256:8865567834e8476c4786f1de4c602b01dec07d2918c6029a9de8233e12a127e3
# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
