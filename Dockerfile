# Use AST Base image
FROM checkmarx/ast-cli:2.2.3

USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

# Ensure the non-root user has the necessary permissions for all directories
RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh \
    && chmod -R 777 /app /github /workspace /home/runner

# Change user to non-root after setting up permissions
USER nonroot
