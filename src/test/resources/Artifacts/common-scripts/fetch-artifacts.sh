#!/bin/bash

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