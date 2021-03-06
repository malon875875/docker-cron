#!/bin/bash

# Start the run once job.
echo "Docker container has been started:" && date

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

# Setup a cron schedule
echo "SHELL=/bin/bash
BASH_ENV=/container.env
* * * * * /run.sh >> /var/log/cron.log 2>&1
* * * * * /run.sh > /proc/1/fd/1 2>&1
# This extra line makes it a valid cron" > scheduler.txt

crontab scheduler.txt
cron -f
