#!/bin/bash
DATE=$(Date +%F-%H-%M)

for i in $@
do
    yum install $i -y &>>/tmp/$i-$DATE.log
done