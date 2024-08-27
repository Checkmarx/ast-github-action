FROM checkmarx/ast-cli:2.2.3

# Use a non-root user
RUN adduser --disabled-password --gecos '' cxuser
USER cxuser

COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh && chmod +x /app/cleanup.sh
