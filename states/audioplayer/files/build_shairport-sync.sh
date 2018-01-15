#!/bin/sh

echo "Configuring the build ..."
autoreconf -i -f
./configure \
  --sysconfdir=/etc \
  --with-alsa \
  --with-stdout \
  --with-pipe \
  --with-avahi \
  --with-ssl=openssl \
  --with-soxr \
  --with-metadata \
  --with-systemd
  
echo "Building & installing shairport-sync ..."
make && make install
