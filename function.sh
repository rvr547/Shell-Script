#!/bin/bash

#!/bin/bash

USERID=$(id -u)


VALIDATE(){
if [ $1 -ne 0 ]
then 
    echo "$2 Installation ........Failure"
else
    echo "$2 Installation ......Successful"
fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROr: Please run this script with root access"
    exit 1
fi


yum install mysql -y

VALIDATE $? "Installing My SQL"


yum install postfix -y

VALIDATE $? "Installing Post fix"



