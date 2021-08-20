package kr.co.everyfarm.user;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

@Service
public class NaverLoginBO {

	private final static String CLIENT_ID = "Ql4Y2VZqHjqj9oNnoWts";
	private final static String CLIENT_SECRET = "dMRJyZO2jJ";
	private final static String REDIRECT_URI = "http://localhost:8090/callback";
	private final static String SESSION_STATE = "oauth_state";
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

	public String getAuthorizationUrl(HttpSession session) {
		 String state = generateRandomString();
		 setSession(session, state);
		 OAuth20Service oauthService = new ServiceBuilder()
	                .apiKey(CLIENT_ID)
	                .apiSecret(CLIENT_SECRET)
	                .callback(REDIRECT_URI)
	                .state(state) //앞서 생성한 난수값을 인증 URL생성시 사용함
	                .build(NaverLoginApi.instance());
	        return oauthService.getAuthorizationUrl();
	}

	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
		String sessionState = getSession(session);
        if (StringUtils.pathEquals(sessionState, state)) {

            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(CLIENT_ID)
                    .apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state)
                    .build(NaverLoginApi.instance());
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
		}
		return null;
	}

	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}

	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}

	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}

	public String getUserProfile(HttpSession session, OAuth2AccessToken oauthToken) throws IOException {
		 OAuth20Service oauthService = new ServiceBuilder()
	                .apiKey(CLIENT_ID)
	                .apiSecret(CLIENT_SECRET)
	                .callback(REDIRECT_URI).build(NaverLoginApi.instance());

	        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
	        oauthService.signRequest(oauthToken, request);
	        Response response = request.send();
	        return response.getBody();
	}
}
