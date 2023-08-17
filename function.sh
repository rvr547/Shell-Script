#!/bin/bash

#!/bin/bash

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
USERID=$(id -u)


VALIDATE(){
if [ $1 -ne 0 ]
then 
    echo "$2  ........Failure"
else
    echo "$2  ......Successful"
fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROr: Please run this script with root access"
    exit 1
fi


yum install mysql -y

VALIDATE $? "Installing My SQL" &>>$LOGFILE


yum install postfix -y

VALIDATE $? "Installing Post fix" &>>$LOGFILE



