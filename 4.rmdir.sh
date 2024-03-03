#!/bin/bash

BASE_DIR="log/test/"

CURRENT_DATE=$(date +%s)

ONE_MONTH=$((CURRENT_DATE - 90*24*60*60))


for dir in $BASE_DIR/*; do
    if [ -d "$dir" ]; then
        DIR_MODIFY_TIME=$(stat -c %Y "$dir")

        if [ "$DIR_MODIFY_TIME" -lt "$ONE_MONTH" ]; then
            echo "Deleting directory: $dir"
            rm -rf "$dir"
        fi
    fi
done
~