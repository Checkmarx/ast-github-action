# Use AST Base image
FROM anjalideore/checkmarx-test@sha256:f939fcfe717c36f2a123735e484a5291d0d01379ab3f10d0c5ad997a4878c262
# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
