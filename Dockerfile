# Use AST Base image
FROM checkmarx/ast-cli:2.3.3@sha256:10a71670e10c344f960e09baf871df6d190cdcc6

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh
