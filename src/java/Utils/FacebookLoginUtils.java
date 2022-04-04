/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Model.FBLoginConstants;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.Version;
import com.restfb.types.User;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author ADMIN
 */
public class FacebookLoginUtils {

    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String link = String.format(FBLoginConstants.FACEBOOK_LINK_GET_TOKEN, FBLoginConstants.FACEBOOK_APP_ID, FBLoginConstants.FACEBOOK_APP_SECRET, FBLoginConstants.FACEBOOK_REDIRECT_URL, code);
        String response = Request.Get(link).execute().returnContent().asString();
        
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = mapper.readTree(response);
        System.out.println(node);
        String accessToken = node.get("access_token").toString().replaceAll("\"", "");
        return accessToken;

    }

    public static User getUserInfo(String accessToken) {
        FacebookClient facebookClient = new DefaultFacebookClient(accessToken, FBLoginConstants.FACEBOOK_APP_SECRET, Version.LATEST);
        System.out.println(facebookClient);
        return facebookClient.fetchObject("me", User.class, Parameter.with("fields", "email,name,link"));
    }
//    public static void main(String[] args) {
//        System.out.println(FacebookLoginUtils.getUserInfo("EAATHlSWmYOsBAGxZBacoJRBO3B6XXlZCSeK1vf8MeMz36NLDrA8aS2gWhPsxxJHlnEj0CDYQJSZAS1OXVmd5kEOGZCR8joyM4HVkw5EbjKWpUsXtuCgBSlEBZBO4sZBZB5oBl2NexLBR9mLvxYhSxdckYUbAp09KdDed5QcvZAFqQtUGGDZBLzKxfmNjC6FgihywX6ZAKpwSVng8U0dZCfPlE1zZBMRV7MRiomODADpS17V7vwRvFBiTqIbr"));
//    }
}
