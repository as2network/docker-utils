#!/bin/sh

set -e

echo "Commencing docker-compose update `date`" >> /var/log/containers/docker-compose-update.log
# Do a pull then an update
/usr/local/bin/docker-compose -f /data/traefik/docker-compose.yml pull --no-parallel >> /var/log/containers/docker-compose-update.log 2>&1
/usr/local/bin/docker-compose -f /data/traefik/docker-compose.yml up -d >> /var/log/containers/docker-compose-update.log 2>&1
echo "Sleeping 10 seconds." >> /var/log/containers/docker-compose-update.log
sleep 10
/usr/local/bin/docker-compose -f /data/traefik/docker-compose.yml restart >> /var/log/containers/docker-compose-update.log 2>&1
echo "Finishing docker-compose update `date`" >> /var/log/containers/docker-compose-update.log
