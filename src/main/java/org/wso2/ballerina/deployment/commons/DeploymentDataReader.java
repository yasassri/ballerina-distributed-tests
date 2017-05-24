package org.wso2.ballerina.deployment.commons;

import org.codehaus.jackson.map.ObjectMapper;
import org.wso2.ballerina.deployment.FrameworkConstants;
import org.wso2.ballerina.deployment.beans.InstanceUrls;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class DeploymentDataReader {

    private List<InstanceUrls> instanceUrlsList;

    public DeploymentDataReader() {
        setInstanceUrlsList();
    }

    private void setInstanceUrlsList() {
        ObjectMapper mapper = new ObjectMapper();
        if (System.getProperty(FrameworkConstants.JSON_FILE_PATH) != null) {
            File file = new File(System.getProperty(FrameworkConstants.JSON_FILE_PATH));
            try {
                this.instanceUrlsList = Arrays.asList(mapper.readValue(file, InstanceUrls[].class));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public List<InstanceUrls> getInstanceUrlsList() {
        return instanceUrlsList;
    }
}
