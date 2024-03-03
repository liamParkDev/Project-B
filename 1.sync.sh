#!/bin/bash

latest_direcroty_log_test=$(ls -dr log/test/*20* 2>/dev/null | head -n1)

cd /root

today=`date +"%F-%H-%M-%S"`

./s3sync --worker-size 128 --delete -v --target-endpoint-url=http://endpointurl.com/ /export/ s3://bucket-url/test/ --acl public-read >> ./$latest_direcroty_log_test/nohup_test.$today 2>&1
