#!/bin/bash

export Today="`date '+%y-%m-%d'`"
host='FTP address'
user='username'
passwd='password'
ftp -n -v $host << EOF
user $id $passwd

cd /
prompt
binary

passive off

mkdir $Today
cd $Today
lcd /backup/$Today
mput *

bye
EOF

exit 0

# 30 8 * * * /bin/bash /home/backup/backup.sh