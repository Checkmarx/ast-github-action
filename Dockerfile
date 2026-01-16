# Build-time argument for custom base registry
# If BASE_REGISTRY is provided, it should be in format: my-registry.example.com/
# If not provided, defaults to Docker Hub
ARG BASE_REGISTRY=""

# Use AST Base image
# When BASE_REGISTRY is empty, this resolves to checkmarx/ast-cli:...
# When BASE_REGISTRY is set (e.g., "my-registry.example.com/"), this resolves to my-registry.example.com/checkmarx/ast-cli:...
FROM ${BASE_REGISTRY}checkmarx/ast-cli:2.3.41@sha256:6eb696e1a1bcc45d7f980763f08f97ab7780e447604f34e83145ad064752ab72

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
