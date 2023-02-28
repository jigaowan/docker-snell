#!/bin/sh
if [ -z "$PSK" ]; then
  PSK=`tr -dc A-Za-z0-9 </dev/urandom | head -c 32 ; echo ''`
fi
mkdir /config
if [ ! -f "/config/snell-server.conf" ]; then
  cat > /config/snell.conf <<EOF
[snell-server]
listen = ::0:7800
psk = ${PSK}
ipv6 = true
EOF
fi
/usr/local/bin/snell-server -c /config/snell-server.conf