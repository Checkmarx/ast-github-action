# Use AST Base image
FROM checkmarx/ast-cli:2.3.18@sha256:97630c49ad845149f86df108f9ee229339be087ab77cb8795f3fda28b92c67dc

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
