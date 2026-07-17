# Use AST Base image
FROM checkmarx/ast-cli:2.3.57@sha256:ce904fe708444872c77d11532df72fbe9e3398bc11eae3407743ee9bd5c35bff

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
