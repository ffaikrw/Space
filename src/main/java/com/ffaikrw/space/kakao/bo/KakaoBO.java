package com.ffaikrw.space.kakao.bo;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.ffaikrw.space.kakao.model.KakaoTokenResponse;

@Service
public class KakaoBO {
	
	private final String grant_type = "authorization_code";
	private final String client_id = "5170fc7c6355db5c1438e9b2e64d78bb";
	private final String redirect_uri = "http://localhost:8080/oauth/kakaoLogin";
	private final String reqTokenURL = "https://kauth.kakao.com/oauth/token";
	
	
	
	// 토큰 발급
	public KakaoTokenResponse getToken(String code) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> parameter = new LinkedMultiValueMap<>();
		parameter.add("grant_type", grant_type);
		parameter.add("client_id", client_id);
		parameter.add("redirect_uri", redirect_uri);
		parameter.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(header, parameter);
		
		return restTemplate.exchange(
				reqTokenURL
				, HttpMethod.POST
				, entity
				, KakaoTokenResponse.class
				).getBody();
		
	}
	
	
	
}
