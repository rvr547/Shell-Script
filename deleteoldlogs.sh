#!/bin/bash
APP_LOGS_DIR=/home/centos/app-logs

DATE=$(date +%F:%H:%M:%S)
LOGSDIR=/home/centos/shellscript-log
# /home/centos/shellscript-logs/script-name-date.log

LOGFILE=$LOGSDIR/$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "script started executing at $DATE" &>>$LOGFILE
echo "$FILES_TO_DELETE"

while read line
do
  echo "Deleting $line" &>>$LOGFILE
  rm -rf $line
done <<< $FILES_TO_DELETE
