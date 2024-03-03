#!/bin/bash

mkdir /root/log/test/$(date +\%Y-\%m)
mkdir /root/log/live/$(date +\%Y-\%m)
mkdir /root/purge_list/test/$(date +\%Y-\%m)
mkdir /root/purge_list/live/$(date +\%Y-\%m)
mkdir /root/purge_log/test/$(date +\%Y-\%m)
mkdir /root/purge_log/live/$(date +\%Y-\%m)

# setting crontab 
# 0 1 1 /bin/bash /root/mkdir.sh > /dev/null 2>&1