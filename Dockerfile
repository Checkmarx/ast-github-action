#Use AST Base image
FROM checkmarx/ast-cli:2.2.3

WORKDIR /app

USER nonroot

RUN chown -R nonroot:nonroot /app

#Copy the entrypoint script and properties used for the action
COPY --chown=nonroot:nonroot --chmod=555 entrypoint.sh /app/entrypoint.sh
COPY --chown=nonroot:nonroot --chmod=555 cleanup.sh /app/cleanup.sh

