package org.wso2.ballerina.deployment.Base;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.wso2.ballerina.deployment.beans.InstanceUrls;
import org.wso2.ballerina.deployment.beans.Port;
import org.wso2.ballerina.deployment.commons.DeploymentConfigurationReader;
import org.wso2.ballerina.deployment.commons.DeploymentDataReader;
import org.wso2.ballerina.deployment.utills.ScriptExecutorUtil;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

public class BallerinaInit {

    private static final Log log = LogFactory.getLog(BallerinaInit.class);
    public static String ballerinaURL;

    protected HashMap<String, String> instanceMap;

    /**
     * This method will initialize test environment
     * based on the configuration given at testng.xml
     */
    protected void init(String pattern) throws Exception {
        setURLs(pattern);
    }

    //set the url's as specified in the deployment.json
    protected void setURLs(String patternName) {

        HashMap<String, String> instanceMap = null;
        try {
            DeploymentConfigurationReader depconf = DeploymentConfigurationReader.readConfiguration();
            instanceMap = depconf.getDeploymentInstanceMap(patternName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        DeploymentDataReader dataJsonReader = new DeploymentDataReader();
        List<InstanceUrls> urlList = dataJsonReader.getInstanceUrlsList();
        for (InstanceUrls url : urlList) {
            if (instanceMap != null) {
                if (url.getLable().equals(instanceMap.get("ballerina"))) {
                    ballerinaURL = getHTTPSUrl("servlet-http", url.getHostIP(), url.getPorts(), "");
                }
            }
        }
    }

    protected String getHTTPSUrl(String protocol, String hostIP, List<Port> ports, String context) {

        String Url = "http://" + hostIP + ":";
        for (Port port : ports) {
            if (port.getProtocol().equals(protocol)) {
                Url = Url + port.getPort() + context;
                break;
            }
        }
        return Url;
    }

    //deploy environment
    protected void setTestSuite(String pattern) throws IOException {

        ScriptExecutorUtil.deployScenario(pattern);

    }

    //undeploy environment
    protected void unSetTestSuite(String pattern) throws Exception {
        ScriptExecutorUtil.unDeployScenario(pattern);
    }

}