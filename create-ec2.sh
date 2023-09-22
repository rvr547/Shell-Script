#!/bin/bash

NAME=("cart" "user" "catalogue" "payment" "mongodb" "mysql" "rabbitmq" "shipping" "redis" "web" "dispatch")
INSTANCE_TYPE=""
IMGID=ami-03265a0778a880afb
SEC_GROUP_ID=sg-0f096ed6f8ae3d1a9
#for mysql and mongo DB istance type should be t3.micro

for i in "${NAME[@]}"
do
  #echo "NAME: $i"
  if [ [ $i == "mongodb" || $i == "mysql" ] ]
  then
    INSTANCE_TYPE="t3.micro"
  else
    INSTANCE_TYPE="t2.micro"
  if
  echo "Creating instance $i "
  aws ec2 run-instances --image-id $IMGID  --instance-type $INSTANCE_TYPE --security-group-ids $SEC_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]"

done
