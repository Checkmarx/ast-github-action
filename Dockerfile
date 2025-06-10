# Use AST Base image
FROM checkmarx/ast-cli:2.3.22@sha256:64cb2c7c244a342f0fe6308654cdac2bee35d26c35985bb97294575c9c192054

USER root
# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh

RUN chown -R nonroot:nonroot /app

RUN chmod -R u+w /app

USER nonroot

HEALTHCHECK NONE
