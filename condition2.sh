#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0]
then
    echo "ERROr: Please run this script with root access"
fi

yum install git -y
