#!/bin/bash

NAME=("cart" "user" "payment" "mongodb" "mysql")

#for mysql and mongo DB istance type should be t3.micro
for i in "${NAMES[@]}"
do
  echo "NAME: $i"
done