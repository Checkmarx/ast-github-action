# Use AST Base image
FROM checkmarx/ast-cli:2.3.43@sha256:0562b4f261fcd682332754aa91e7b1e958846aaa8d9512983988a5a245b3454c

# Docker actions must be run by the default Docker user (root).
USER root

# Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY scripts /app/scripts/
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh \
    && chmod +x /app/scripts/


HEALTHCHECK NONE
