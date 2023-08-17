#!/bin/bash
DATE=$(date +%F-%H-%M)
Validate()
{
  if [ $1 -ne 0 ]
then 
    echo -e "$2  ........$R Failure $N"
else
    echo  -e "$2  ......$G Successful $N"
fi  
}

for i in $@
do
    yum install $i -y &>>/tmp/$i-$DATE.log
    validate $? "$i installation"
done