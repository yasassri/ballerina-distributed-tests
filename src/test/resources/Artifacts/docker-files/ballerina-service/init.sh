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

# Docker init script, this is the Entry Point of the Docker image
# These variables are parsed as Environment variables through Kubernetes controller

#pattern=null
#ballerina_home=/opt/ballerina
#ballerina_test_repo=https://github.com/yasassri/ballerina-distributed-tests.git
#ballerina_test_repo_name=ballerina-distributed-tests

mkdir -p ${ballerina_home}
cd ${ballerina_home}
mkdir distribution

echo "Cloning the Ballerina Test Repo!!!"
git clone ${ballerina_test_repo}

cd ${ballerina_home}/${ballerina_test_repo_name}/src/test/resources/Artifacts/common-scripts
sh fetch-artifacts.sh