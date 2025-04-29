# Use AST Base image
FROM anjalideore/checkmarx-test:latest@sha256:8d749660b929376a9a4f229842972acf26d6aa967f0260a89c15255d25d835e3
# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
