# Use AST Base image
FROM checkmarx/ast-cli:2.3.12@sha256:addbc5a34ed8dfe65dba5879a846b487fbac179c45ef4ca4385038684324407a

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
