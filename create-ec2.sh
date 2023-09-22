#!/bin/bash

NAME=("cart" "user" "catalogue" "payment" "mongodb" "mysql" "rabbitmq" "shipping" "redis" "web" "dispatch")

#for mysql and mongo DB istance type should be t3.micro

for i in "${NAME[@]}"
do
  echo "NAME: $i"
done
#echo "NAME: $i"