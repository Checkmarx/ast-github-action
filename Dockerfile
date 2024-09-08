FROM checkmarx/ast-cli:2.2.3

# Set up application user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set working directory and copy scripts
WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

# Adjust permissions for app directory
RUN chown -R appuser:appgroup /app && chmod +x /app/entrypoint.sh && chmod +x /app/cleanup.sh

USER appuser

# Entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
