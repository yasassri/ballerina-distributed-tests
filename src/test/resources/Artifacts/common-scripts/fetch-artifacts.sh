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

# This file is triggered from init.sh with the Docker Entry point

#Download the latest dirtribution
sh get-latest-distribution.sh

#Extract the distribution to the temporary location and move it to the distribution directory
mkdir tmp
unzip ballerina-tools-*.zip -d tmp/

cp -r tmp/*/* ${ballerina_home}/distribution/
rm -rf tmp

#Copy the dependency Jars to the server
cp -r ${ballerina_home}/${balerina_test_repo_name}/src/test/resources/Artifacts/${pattern}/bre/lib/* ${ballerina_home}/distribution/bre/lib

#cd into the services package structure root
cd ${ballerina_home}/${balerina_test_repo_name}/src/test/resources/Artifacts/${pattern}

#Start the Server
sh ${ballerina_home}/distribution/ballerina.sh services