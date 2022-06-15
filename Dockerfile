#Use AST Base image
FROM checkmarx/ast-cli:2.0.19

#Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$USER" \
    --no-create-home \
    --uid "12345" \
    "cxuser"

RUN chown -R cxuser:cxuser /app

RUN chmod +x /app/entrypoint.sh
RUN chmod +x /app/cleanup.sh

USER cxuser