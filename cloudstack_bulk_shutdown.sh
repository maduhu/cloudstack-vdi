#!/bin/bash

# Bulk Shutdown VM's in CloudStack
# falcon78921

# First, we need a group ID

read -p "What is the VM Group ID? " varGroupId
read -p "What is the CloudStack UI URL? " varCloudStackUi

# Now, we fetch VM's that are in the group and get their VM ID's

curlUrl="http://${varCloudStackUi}:8096/client/api?command=listVirtualMachines&groupid=${varGroupId}&response=json"
curl -s $curlUrl > vminstances.json

# jq dis here file

vmId=$(jq '.listvirtualmachinesresponse.virtualmachine[].id' vminstances.json | tr -d '"')

# Array it up!

vmIdArray=( $vmId )

for i in "${vmIdArray[@]}"  
do  
    curlUrl="http://${varCloudStackUi}:8096/client/api?command=stopVirtualMachine&id=${i}"
    curl $curlUrl
done  

# Delete vminstances.json

rm vminstances.json
