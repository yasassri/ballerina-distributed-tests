#!/bin/bash

pattern=null
ballerina_home=/home/yasassri/QA_STUFF/current_work/Ballerina_prod/test-repo/shell/bal_home
ballerina_test_repo=https://github.com/yasassri/ballerina-distributed-tests.git
balerina_test_repo_name=ballerina-distributed-tests

#TO-DO : handle if pattern is not set

mkdir -p ${ballerina_home}
cd ${ballerina_home}
mkdir distribution

echo "Cloning the Ballerina Repo!"
git clone ${ballerina_test_repo}

#CD into the Git artefact directory
cd ${ballerina_home}/${balerina_test_repo_name}/src/test/resources/Artifacts/common-scripts

#Download the latest dirtribution
sh get-latest-distribution.sh

#Extract the distribution to the temporary location and moving to the distribution directory
mkdir tmp
unzip ballerina-tools-*.zip -d tmp/

cp -r tmp/*/* ${ballerina_home}/distribution/
rm -rf tmp

#Copy the dependeny Jars to the server
cp -r ${ballerina_home}/${balerina_test_repo_name}/src/test/resources/Artifacts/${pattern}/bre/lib/* ${ballerina_home}/distribution/bre/lib

# CD into the services package structure root
cd ${ballerina_home}/${balerina_test_repo_name}/src/test/resources/Artifacts/${pattern}

# Start the Server
sh ${ballerina_home}/distribution/ballerina.sh services