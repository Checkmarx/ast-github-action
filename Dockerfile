#Use AST Base image
FROM checkmarx/ast-cli:2.2.3

USER root

RUN mkdir -p /log

USER nonroot

#Copy the entrypoint script and properties used for the action
COPY --chmod=555 entrypoint.sh /app/entrypoint.sh
COPY --chmod=555 cleanup.sh /app/cleanup.sh

