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

/**
 * Deployment Yaml Constants.
 */
public class DeploymentYamlConstants {
    public static final String DEPLYMENT_YAML_FILE_NAME = "deployment.yaml";
    public static final String YAML_DEPLOYMENTS = "deployments";
    protected static final String YAML_DEPLOYMENT_PORTS = "ports";
    protected static final String YAML_DEPLOYMENT_PORT_NAME = "name";
    protected static final String YAML_DEPLOYMENT_PORT_TARGET_PORT = "targetPort";
    protected static final String YAML_DEPLOYMENT_PORT_PORT = "port";
    protected static final String YAML_DEPLOYMENT_PORT_NODE_PORT = "nodePort";
    protected static final String YAML_DEPLOYMENT_PORT_PROTOCOL = "protocol";
    protected static final String YAML_DEPLOYMENT_INSTANCES_ENV_MAP = "envVariableMap";
    protected static final String YAML_DEPLOYMENT_SCRIPT = "deployscripts";
    protected static final String YAML_DEPLOYMENT_NAME = "name";
    protected static final String YAML_DEPLOYMENT_REPO = "repository";
    protected static final String YAML_DEPLOYMENT_SUITE = "suite";
    protected static final String YAML_UNDEPLOYMENT_SCRIPT = "undeployscripts";
    protected static final String YAML_DEPLOYMENT_URL_FILE_PATH = "filePath";
    protected static final String YAML_DEPLOYMENT_INSTANCE_MAP = "instancemap";
}
