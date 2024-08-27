# Use AST Base image
FROM checkmarx/ast-cli:2.2.3

# Switch to root to make changes
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

# Make scripts executable
RUN chmod +x /app/entrypoint.sh && \
    chmod +x /app/cleanup.sh

# Create a non-root user
RUN useradd -m myuser

# Create necessary directories and set permissions
RUN mkdir -p /github /github/workspace /github/home /github/file_commands && \
    chown -R myuser:myuser /app /github

# Switch to the non-root user
USER myuser

# Set the working directory
WORKDIR /github/workspace

# Set the entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]