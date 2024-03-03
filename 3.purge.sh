#!/bin/bash

latest_test_purge_list_directory=$(find purge_list/test/ -maxdepth 1 -type d -printf '%T+ %p\n' | sort -r | head -n 1 | awk '{print $2}')
latest_test_purge_file=$(find "$latest_test_purge_list_directory" -type f -printf '%T+ %p\n' | sort -r | head -n 1 | awk '{print $2}')
latest_test_purge_log_directory=$(find purge_log/test/ -maxdepth 1 -type d -printf '%T+ %p\n' | sort -r | head -n 1 | awk '{print $2}')
latest_test_purge_log_file=$(find "$latest_test_purge_log_directory" -type f -printf '%T+ %p\n' | sort -r | head -n 1 | awk '{print $2}')

today=`date +"%F-%H-%M-%S"`

sed ':a;N;$!ba;s/\n/ /g' "$latest_test_purge_file" > $latest_test_purge_log_directory/purge_log_qa_$today 2>&1

akamai purge invalidate $(cat "$latest_test_purge_log_file")