# Use AST Base image
FROM checkmarx/ast-cli:2.3.31@sha256:f06e1168eb5c1d1706e53c43cdfa49eb758940a6e29b4532f686a8af56a5a28e

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
