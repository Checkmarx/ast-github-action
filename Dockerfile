# Use AST Base image
FROM checkmarx/ast-cli:2.3.47@sha256:ea78120f76544bd01e5af89abae15bdb870cc869a9542cc0d7b8ad8914d39213

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
