# Use AST Base image
# FROM anjalideore/checkmarx-test:latest@sha256:715e817a00fcfc4cc5c4ed72debb4a6f9b38b22348e36f190e4a1f985cc7661e
# Docker actions must be run by the default Docker user (root).

FROM checkmarx/ast-cli:2.3.19@sha256:e6c50b070ac33e3476dcf221f8ec6903461f9003d8cb0b8b07f71f0107b5f5e2

USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh


HEALTHCHECK NONE
