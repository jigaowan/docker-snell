FROM debian:latest-slim

ENV PORT=
ENV PSK=

COPY snell-server /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
