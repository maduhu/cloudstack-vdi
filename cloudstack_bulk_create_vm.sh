#!/bin/bash

# Create Bulk Instances within Apache CloudStack
# falcon78921

# First, we need some information. This creates x instances per script execution.

read -p "What is the naming convention of the instances? " varInstanceName
read -p "How many instances do you want? " varInstanceCount
read -p "What is the URL for the Apache CloudStack UI? " varCloudStackUi
read -p "What is the service offering ID? " varServiceOfferingId
read -p "What is the desired root disk offering? " varDiskOfferingSize
read -p "What is the template ID? " varTemplateId
read -p "What is the group ID? " varGroupId
read -p "What is the zone ID? " varZoneId

# Now, we calculate instance creation.

for x in $(seq 1 $varInstanceCount);
do 
	curlUrl="http://${varCloudStackUi}:8096/client/api?command=deployVirtualMachine&name=${varInstanceName}-${x}&serviceOfferingId=${varServiceOfferingId}&rootdisksize=${varDiskOfferingSize}&templateId=${varTemplateId}&zoneId=${varZoneId}&groupId=${varGroupId}"
       curl $curlUrl
done
