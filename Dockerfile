FROM alpine:latest

RUN apk add --no-cache git build-base openssl-dev lua5.3 lua5.3-dev lua5.3-sec lua5.3-socket lua5.3-lyaml lua5.3-filesystem luarocks5.3


COPY . /app
WORKDIR /app

RUN ./setup.sh

CMD ["./start.sh"]
