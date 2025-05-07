package com.itwillbs.service;

import java.io.*;
import java.net.*;
import java.util.*;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class KakaoService {

    public String getAccessToken(String code) throws Exception {
    	System.out.println("kakaoController getAccessTolken");
        String requestUrl = "https://kauth.kakao.com/oauth/token";
        URL url = new URL(requestUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        String body = "grant_type=authorization_code"
                    + "&client_id=69648cd5739ce310afc751e72d423fca"
                    + "&redirect_uri=http://localhost:8080/teamone/member/kakaoLogin"
                    + "&code=" + code;

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        bw.write(body);
        bw.flush();

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String result = "", line;
        while ((line = br.readLine()) != null) {
            result += line;
        }

        JSONObject json = new JSONObject(result);
        return json.getString("access_token");
    }

    public Map<String, Object> getUserInfo(String accessToken) throws Exception {
    	System.out.println("kakaoController getUserInfo");
        String requestUrl = "https://kapi.kakao.com/v2/user/me";
        URL url = new URL(requestUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String result = "", line;
        while ((line = br.readLine()) != null) {
            result += line;
        }

        JSONObject json = new JSONObject(result);
        JSONObject kakaoAccount = json.getJSONObject("kakao_account");

        Map<String, Object> userInfo = new HashMap<>();
        userInfo.put("email", kakaoAccount.getString("email"));

        return userInfo;
    }
}
