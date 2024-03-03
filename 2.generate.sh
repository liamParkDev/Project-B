#!/bin/bash

printf "Please input environment (live, test): "
read environment

latest_direcroty_log_test=$(ls -dr log/test/*20* 2>/dev/null | head -n1)
latest_direcroty_log_live=$(ls -dr log/live/*20* 2>/dev/null | head -n1)
latest_direcroty_purge_test=$(ls -dr purge_list/test/*20* 2>/dev/null | head -n1)
latest_direcroty_purge_live=$(ls -dr purge_list/live/*20* 2>/dev/null | head -n1)

if [ -z "$environment" ]; then
    echo "No environment"
    exit 1
fi

if [ "$environment" == "test" ] || [ "$environment" == "live" ]; then
    if [ "$environment" == "test" ]; then
        latest_file=$(ls -t $latest_direcroty_log_test/*test* 2>/dev/null | head -n1)
    else
        latest_file=$(ls -t $latest_direcroty_log_live/*live* 2>/dev/null | head -n1)
    fi

    if [ -z "$latest_file" ]; then
        echo "No $environment file found in the directory"
        exit 1
    fi

    filename=$(basename "$latest_file")

    if [ "$environment" == "test" ]; then
        cat "$latest_direcroty_log_test/$filename" | awk -F"key" '{print $2}' | awk -F"\"" '{print $2}' | sed "s/game/https:\/\/patch-test.com\/test\/servername/g" > "$latest_direcroty_purge_test/$filename-purge_list"
    elif [ "$environment" == "live" ]; then
        cat "$latest_direcroty_log_live/$filename" | awk -F"key" '{print $2}' | awk -F"\"" '{print $2}' | sed "s/game/https:\/\/patch-test.com\/live\/servername/g" > "$latest_direcroty_purge_live/$filename-purge_list"
    fi
    else
    echo "Invalid environment"
    exit 1
    fi

    if [ "$environment" == "test" ]; then
        cat $latest_direcroty_purge_test/$(ls -t $latest_direcroty_purge_test/ | head -1)
    elif [ "$environment" == "live" ]; then
        cat $latest_direcroty_purge_live/$(ls -t $latest_direcroty_purge_live/ | head -1)
else
    echo "Invalid environment"
    exit 1
fi
