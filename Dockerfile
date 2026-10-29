# Use AST Base image
FROM checkmarx/ast-cli:2.3.69@sha256:1574a3c34ca60cdf5661f1394755e9a3d9cd0d43388215f0fef3148bcfe54549
# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY scripts /app/scripts/
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh \
    && chmod +x /app/scripts/


HEALTHCHECK NONE
