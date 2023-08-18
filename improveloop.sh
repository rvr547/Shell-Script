#!/bin/bash
DATE=$(date +%F-%H-%M)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
LOGDIR=/home/centos/shellscript-log
LOGFILE=$0-$DATE.log
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: Root access required to install the package $N"
    exiit 1
fi

VALIDATE()
{
  if [ $1 -ne 0 ]
then 
    echo -e "$2  ........$R Failure $N"
    exit 1
else
    echo  -e "$2  ......$G Successful $N"
fi  
}

for i in $@
do
    yum installed $i
    if [$? -ne 0]
    then
        echo "$i not installed lets install it"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i installation"
    else
        echo -e "$Y $i already installed $N"
    if
done