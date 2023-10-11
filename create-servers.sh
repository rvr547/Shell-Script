#!/bin/bash

NAME=$@
INSTANCE_TYPE=""
IMGID=ami-03265a0778a880afb
SEC_GROUP_ID=sg-0f096ed6f8ae3d1a9
DOMAIN_NAME=preprv.online
#for mysql and mongo DB istance type should be t3.micro

for i in $@
do
  
  if [[ $i == "mongodb" || $i == "mysql" ]]
  then
    INSTANCE_TYPE="t3.micro"
  else
    INSTANCE_TYPE="t2.micro"
  fi
  echo "Creating instance $i "
  IP_ADDRESS=$(aws ec2 run-instances --image-id $IMGID  --instance-type $INSTANCE_TYPE --security-group-ids $SEC_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" |  jq -r '.Instances[0].PrivateIpAddress')
  echo "created $i instances: $IP_ADRESS"

  aws route53 change-resource-record-sets --hosted-zone-id Z0344012ZLXQ2X88NXH1 --change-batch '
  {
            "Changes": [{
            "Action": "CREATE",
                        "ResourceRecordSet": {
                                    "Name": "'$i.$DOMAIN_NAME'",
                                    "Type": "A",
                                    "TTL": 1,
                                 "ResourceRecords": [{ "Value": "'$IP_ADDRESS'"}]
                          }}]
  }
  '


done
