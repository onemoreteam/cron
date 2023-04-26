#!/bin/sh

env >> /etc/environment

FILE="/var/spool/cron/crontabs/$(whoami)"

echo "${JOB}" > $FILE

for i in $(seq 0 9); do eval echo \"\${JOB$i}\" >> /var/spool/cron/crontabs/$(whoami); done

exec /sbin/tini -- $@
