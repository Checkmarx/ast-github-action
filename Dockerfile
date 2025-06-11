# Use AST Base image
FROM checkmarx/ast-cli:2.3.23@sha256:c0f982b44c5a94989e087bf68d6c64329312930d488a91b2667fb6b3d697a252

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
