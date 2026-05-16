ARG DOCKER_PLATFORM
ARG DOCKER_ARCH

# upgrade debian from bookworm to trixie
FROM --platform=${DOCKER_PLATFORM:-linux/amd64} ${DOCKER_ARCH:-amd64}/debian:trixie-slim
ARG GOARCH
ARG VERSION_SERVER_URL
ARG SUPERVISOR_SERVER
ENV GOARCH=${GOARCH:-amd64} \
    VERSION_SERVER_URL=${VERSION_SERVER_URL:-https://version.storj.io} \
    SUPERVISOR_SERVER=${SUPERVISOR_SERVER:-unix}

RUN apt-get update
RUN apt-get install -y --no-install-recommends ca-certificates supervisor unzip wget
RUN update-ca-certificates

# add non-root user
RUN groupadd -g 10001 storj && \
    useradd -u 10001 -g storj -d /app -s /usr/sbin/nologin storj

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
