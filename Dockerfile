FROM debian:stable-slim

ENV PSK=

COPY snell-server /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
