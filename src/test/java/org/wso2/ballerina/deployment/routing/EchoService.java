package org.wso2.ballerina.deployment.routing;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.testng.annotations.Test;
import org.wso2.ballerina.deployment.Base.BallerinaBaseTest;

import static org.testng.Assert.assertEquals;

public class EchoService extends BallerinaBaseTest {

    @Test
    public void getPostToEcho() throws Exception{
        String serviceURL = ballerinaURL + "/echo";
        String tempURL = "http://203.94.95.197:32013/echo";

        StringRequestEntity requestEntity = new StringRequestEntity(
                "{ \"Hello\":\"Ballerina\" };",
                "application/json",
                "UTF-8");

        HttpClient client = new HttpClient();
        PostMethod post = new PostMethod(tempURL);

        post.setRequestEntity(requestEntity);

        int statuscode = client.executeMethod(post);
        assertEquals(statuscode, 200);
    }
}
