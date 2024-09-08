# Use AST Base image
FROM checkmarx/ast-cli:2.2.3

USER root

# Create a non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set the working directory to /app
WORKDIR /app

# Copy the entrypoint and cleanup scripts
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

# Set the ownership of the /app directory to the non-root user
RUN chown -R appuser:appgroup /app

# Ensure scripts are executable
RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh

# Switch to non-root user
USER appuser

# Set entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
