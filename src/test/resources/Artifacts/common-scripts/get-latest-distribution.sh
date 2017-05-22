#!/bin/sh

jenkins_base_url="https://wso2.org/jenkins/job/ballerinalang/job/tools-distribution"

#Get the Latest Successful Build URL from JENKINS
latest_successfull_build=$(curl -s "$jenkins_base_url/api/xml?xpath=//lastSuccessfulBuild/url")
#echo "Lates Successfull Build : "$latest_successfull_build

#Extract the URL from the above
latest_successfull_build_url=$(echo $latest_successfull_build | sed -n 's:.*<url>\(.*\)</url>.*:\1:p')
echo "Lates Successfull Build : "$latest_successfull_build_url

# Get the relativePath of the distribution pack
dirtribution_url=$(curl -s -G $latest_successfull_build_url"org.ballerinalang.tools\$ballerina-tools/api/xml" -d xpath=\(/mavenBuild//relativePath\)[2])
#echo "Destribution URL : "$dirtribution_url

# Extracting the relative path to the distribution pack
downloadable_url=$(echo $dirtribution_url | sed -n 's:.*<relativePath>\(.*\)</relativePath>.*:\1:p')
#echo "Relative path of the Distribution : "$downloadable_url

echo "Downloadable URL : " $latest_successfull_build_url"org.ballerinalang.tools\$ballerina-tools/artifact/"$downloadable_url
wget $latest_successfull_build_url"org.ballerinalang.tools\$ballerina-tools/artifact/"$downloadable_url



