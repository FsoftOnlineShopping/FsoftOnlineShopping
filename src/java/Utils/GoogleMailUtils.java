/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Model.GGLoginConstants;
import Model.GG_OAuth2_UserClaims;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.ClientProtocolException;

/**
 *
 * @author ADMIN
 */
public class GoogleMailUtils {

    public static String getToken(final String code) throws IOException {
        String response;
        response = Request.Post(GGLoginConstants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", GGLoginConstants.GOOGLE_CLIENT_ID)
                        .add("client_secret", GGLoginConstants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", GGLoginConstants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", GGLoginConstants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = mapper.readTree(response);
        String accessToken = node.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }
    public static GG_OAuth2_UserClaims getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
    String link = GGLoginConstants.GOOGLE_LINK_GET_USER_INFO + accessToken;
    String response = Request.Get(link).execute().returnContent().asString();
    GG_OAuth2_UserClaims userInfo = new ObjectMapper().readValue(response, GG_OAuth2_UserClaims.class);
    System.out.println(userInfo);
    return userInfo;
  }
}
