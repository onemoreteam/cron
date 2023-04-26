#!/bin/sh

env >> /etc/environment

echo "${CRON}" > /var/spool/cron/crontabs/$(whoami)

exec "$@"
