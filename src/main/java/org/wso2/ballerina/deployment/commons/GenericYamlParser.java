/*
 *  Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

package org.wso2.ballerina.deployment.commons;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.yaml.snakeyaml.Yaml;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Map;

/**
 * Universal yaml parser class - parses yaml files
 */
class GenericYamlParser {

    private Log log = LogFactory.getLog(org.wso2.ballerina.deployment.commons.GenericYamlParser.class);

    Map<String, String> yamlInitializer(String fileName) {

        Yaml yaml = new Yaml();
        Map<String, String> map = null;

        try {
            InputStream inputStream = new FileInputStream(new File(fileName));

            // Parse the YAML file and return the output as a series of Maps and Lists
            map = (Map<String, String>) yaml.load(inputStream);

        } catch (Exception e) {
            log.error("Error " + e.getMessage());
        }
        return map;
    }
}



