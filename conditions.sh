#!bin/bash

echo "Enter a number"
read A
if [ $A -gt 10 ]
then 
   echo "$A is greater than 10"

else 
    echo "$A is less than 10"
fi