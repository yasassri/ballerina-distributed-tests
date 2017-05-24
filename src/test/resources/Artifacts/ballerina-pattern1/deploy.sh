#!/bin/bash
# Copyright (c) 2017, WSO2 Inc. (http://wso2.com) All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

prgdir=$(dirname "$0")
script_path=$(cd "$prgdir"; pwd)
echo $KUBERNETES_MASTER
echo $script_path
echo "Creating the K8S Pods!!!!"
kubectl create -f $script_path/ballerina_test_service.yaml
kubectl create -f $script_path/ballerina_test_rc.yaml

### Add the Waiting Logic Here TO-DO : ATM The host is hard coded, Need to improve this.
host=192.168.57.143
port=32013
echo "Waiting Ballerina to launch on http://${host}:${port}"
sleep 10
until $(curl --output /dev/null --silent --get --fail http://${host}:${port}/hello); do
    printf '.'
    sleep 3
done
echo 'Server started successfully!! Generating The deployment.json!'
pods=$(kubectl get pods --output=jsonpath={.items..metadata.name})
json='['
for pod in $pods; do
         hostip=$(kubectl get pods "$pod" --output=jsonpath={.status.hostIP})
         lable=$(kubectl get pods "$pod" --output=jsonpath={.metadata.labels.name})
         servicedata=$(kubectl describe svc "$lable")
         json+='{"hostIP" :"'$hostip'", "lable" :"'$lable'", "ports" :['
         declare -a dataarray=($servicedata)
         let count=0
         for data in ${dataarray[@]}  ; do
            if [ "$data" = "NodePort:" ]; then
            IFS='/' read -a myarray <<< "${dataarray[$count+2]}"
            json+='{'
            json+='"protocol" :"'${dataarray[$count+1]}'",  "port" :"'${myarray[0]}'"'
            json+="},"
            fi

         ((count+=1))
         done
         i=$((${#json}-1))
         lastChr=${json:$i:1}

         if [ "$lastChr" = "," ]; then
         json=${json:0:${#json}-1}
         fi

         json+="]},"
done

json=${json:0:${#json}-1}

json+="]"

echo $json;

cat > deployment.json << EOF1
$json
EOF1