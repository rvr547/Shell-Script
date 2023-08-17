#!/bin/bash

#!/bin/bash

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
USERID=$(id -u)


VALIDATE(){
if [ $1 -ne 0 ]
then 
    echo -e "$2  ........$R Failure $N"
else
    echo  -e "$2  ......$G Successful $N"
fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROr: Please run this script with root access"
    exit 1
fi


yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installing My SQL" 


yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing Post fix" 



