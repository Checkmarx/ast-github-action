# Use AST Base image
FROM checkmarx/ast-cli:2.2.3

# Create a non-root user and group
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

# Set appropriate permissions and make scripts executable
RUN chmod 755 /app/entrypoint.sh /app/cleanup.sh

# Switch to the non-root user
USER appuser

# Set the entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]