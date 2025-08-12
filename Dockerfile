# Use AST Base image
FROM checkmarx/ast-cli:2.3.30@sha256:42428964bbb173c9360646ca5377939826fb7045246a661a44e82bf48d0d40ce

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
