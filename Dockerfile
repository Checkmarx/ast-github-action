#Use AST Base image
FROM checkmarx/ast-cli:2.2.5

WORKDIR /app

USER root
RUN chown -R nonroot:nonroot /app
USER nonroot

#Copy the entrypoint script and properties used for the action
COPY --chown=nonroot:nonroot --chmod=755 entrypoint.sh /app/entrypoint.sh
COPY --chown=nonroot:nonroot --chmod=755 cleanup.sh /app/cleanup.sh

