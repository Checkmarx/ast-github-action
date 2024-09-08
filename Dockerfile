FROM checkmarx/ast-cli:2.2.3

# Adjust permissions for any directories or files before switching to nonroot
USER root
RUN chmod -R u+w /app && \
    chmod -R o+w /github/file_commands || true # Conditional to avoid errors if the directory doesn't exist

# Switch back to the nonroot user provided by the base image

# Define working directory and copy necessary scripts
WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

# Ensure scripts have execute permissions
RUN chmod +x /app/entrypoint.sh /app/cleanup.sh

ENTRYPOINT ["/app/entrypoint.sh"]
USER nonroot

