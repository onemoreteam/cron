#!/bin/sh

env >> /etc/environment

CRONTAB="/var/spool/cron/crontabs/$(whoami)"

cat /dev/null > $CRONTAB

env | while IFS='=' read -r K V; do [ $(echo $K|cut -b-8) = "CRON_JOB" ] && echo -e "# $K\n$V" >> $CRONTAB; done

exec /sbin/tini -- $@

