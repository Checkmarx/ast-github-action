#Use AST Base image
FROM checkmarx/ast-cli:2.2.3

USER root

ARG CURL_OPTS="--fail --location --show-error --silent"
ARG SCA_RESOLVER_URL="https://sca-downloads.s3.amazonaws.com/cli/latest/ScaResolver-musl64.tar.gz"

RUN apk add --no-cache libstdc++ zlib
RUN apk add --no-cache curl                                                    \
    && _tmp="$(mktemp -t -d scaresolver.XXXXXXX)"                              \
    && curl ${CURL_OPTS} --output "${_tmp}/scaresolver.tar.gz"                 \
         "${SCA_RESOLVER_URL}"                                                 \
    && tar --extract                                                           \
           --gzip                                                              \
           --file "${_tmp}/scaresolver.tar.gz"                                 \
           --directory="/app/bin"                                              \
    && chmod +x "/app/bin/ScaResolver"                                         \
    && rm -rf "${_tmp}"                                                        \
    && unset _tmp                                                              \
    && apk del --no-cache curl

#Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
COPY cleanup.sh /app/cleanup.sh

RUN chmod +x /app/entrypoint.sh \
    && chmod +x /app/cleanup.sh
