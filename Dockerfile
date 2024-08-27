# Use the base image
FROM checkmarx/ast-cli:2.2.3

# Create a new user
RUN adduser --disabled-password --gecos '' cxuser \
    && usermod -aG sudo cxuser \
    && echo 'cxuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the new user
USER cxuser

# Copy scripts to the /app directory
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

# Grant execution permissions to the scripts
RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh

