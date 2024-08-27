#Use AST Base image
FROM checkmarx/ast-cli:2.2.3

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install curl -y && \
    apt-get clean

#Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh

    
