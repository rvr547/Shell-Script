DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
DUSAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DUSAG_ETHRESHOLD=1
Message=

#IFS means internal field saparator
while IFS= read line
do
    #to get usage in number df -hT | grep -vE 'tmpfs|Filesystem' | awk {'print $6'} | cut -d % -f1
    usage=$(echo $line | awk {'print $6'} | cut -d % -f1)
    partition=$(echo $line | awk {'print $1'} )
    if [ $usage -gt $DUSAG_ETHRESHOLD ]
    then
        Message+="High Disk usage on $partition : $usage \n"
    fi
done <<<$DUSAGE

echo -e "$Message"
