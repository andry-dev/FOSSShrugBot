FROM alpine:latest

COPY . /app
WORKDIR /app

RUN set -eux; \
    apk add --no-cache git build-base openssl-dev yaml-dev \
            lua5.3 lua5.3-dev lua5.3-sec lua5.3-socket lua5.3-lyaml \
            lua5.3-filesystem luarocks5.3; \
    git config --global url."https://".insteadOf git://; \
    ./setup.sh;

CMD ["./start.sh"]
