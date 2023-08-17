#!/bin/bash

#!/bin/bash

USERID=$(id -u)

VALIDATE(){
if [ $1 -ne 0 ]
then 
    echo "Installation Failure"
else
    echo "Installation Successful"
fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROr: Please run this script with root access"
    exit 1
fi


yum install mysql -y

VALIDATE $?


yum install postfix -y

VALIDATE $?



