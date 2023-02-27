#!/bin/sh
if [ -z "$PSK" ]; then
  PSK=`hexdump -n 16 -e '4/4 "%08x" 1 "\n"' /dev/urandom`
fi
if [ -z "$PORT" ]; then
  PORT=`shuf -i 10000-30000 -n 1`
fi
mkdir /config
if [ ! -f "/config/snell.conf" ]; then
  cat > /config/snell.conf <<EOF
[snell-server]
listen = ::0:${PORT}
psk = ${PSK}
ipv6 = true
EOF
fi
/usr/local/bin/snell-server -c /config/snell-server.conf