#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROr: Please run this script with root access"
    exit 1
fi


yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "Installation of mysql is not complete"
else
    echo "Installation Successful"
fi

yum install postfix -y

if [ $? -ne 0 ]
then 
    echo "Installation of postfix is not complete"
else
    echo "Installation Successful"
fi



