DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
DUSAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DUSAG_ETHRESHOLD=1

#IFS means internal field saparator
while IFS= read line
do
    echo "$line"
done <<<$DUSAGE
