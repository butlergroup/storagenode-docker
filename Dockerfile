# upgrade from Debian to Chainguard Wolfi
FROM cgr.dev/chainguard/wolfi-base:latest@sha256:f7b8a6213d3d730683dca3e0f5afdd72f2f8823c19e10659a0185ce3da909d9d
ARG GOARCH
ARG VERSION_SERVER_URL
ARG SUPERVISOR_SERVER
ENV GOARCH=${GOARCH:-amd64} \
    VERSION_SERVER_URL=${VERSION_SERVER_URL:-https://version.storj.io} \
    SUPERVISOR_SERVER=${SUPERVISOR_SERVER:-unix}

RUN apk add --no-cache \
    ca-certificates \
    supervisor \
    unzip \
    wget
RUN update-ca-certificates

# add non-root user
RUN addgroup -g 10001 storj && \
    adduser -D -u 10001 -G storj -h /app -s /sbin/nologin storj

RUN mkdir -p /var/log/supervisor /app

COPY docker/ /

# set permissions to allow non-root access but non-world-writable
RUN chown -R storj:storj /etc/supervisor /var/log/supervisor /app && \
    chmod -R u+rw,g+rw,o-rwx /etc/supervisor /var/log/supervisor /app
# remove the default supervisord.conf
RUN rm -rf /etc/supervisord.conf
# create a symlink to custom supervisord config file at the default location
RUN ln -s /etc/supervisor/supervisord.conf /etc/supervisord.conf

EXPOSE 28967
EXPOSE 14002

WORKDIR /app

ENV ADDRESS="" \
    EMAIL="" \
    WALLET="" \
    STORAGE="2.0TB" \
    SETUP="false" \
    AUTO_UPDATE="true" \
    LOG_LEVEL="" \
    BINARY_STORE_DIR="/app/config/bin"

# run container as non-root
USER storj
ENTRYPOINT ["/entrypoint"]
