package com.ffaikrw.space.kakao.bo;

import java.io.IOException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ffaikrw.space.kakao.model.KakaoTokenResponse;
import com.ffaikrw.space.kakao.model.KakaoUserResponse;

@Service
public class KakaoBO {
	
	private final String grant_type = "authorization_code";
	private final String client_id = "5170fc7c6355db5c1438e9b2e64d78bb";
	private final String redirect_uri = "http://localhost:8080/user/oauth/kakaoLogin";
	private final String reqTokenURL = "https://kauth.kakao.com/oauth/token";
	private final String reqUserInfoURL = "https://kapi.kakao.com/v2/user/me";
	
	
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
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(parameter, header);
		
		ResponseEntity<String> responseToken = restTemplate.exchange(
				reqTokenURL
				, HttpMethod.POST
				, entity
				, String.class
				);
		
		
		// json 형태의 token response를 KakaoTokenResponse dto에 담기
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		KakaoTokenResponse kakaoTokenResponse = null;
		
		try {
			kakaoTokenResponse = objectMapper.readValue(responseToken.getBody(), KakaoTokenResponse.class);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return kakaoTokenResponse;
	}
	

	
	// 사용자 정보 가져오기
	public KakaoUserResponse getUserInfo(String accessToken) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders();
		header.add("Authorization", "Bearer " + accessToken);
		header.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(header);
		
		ResponseEntity<String> responseUserInfo = restTemplate.exchange(
				reqUserInfoURL
				, HttpMethod.POST
				, entity
				, String.class
				);
		
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		KakaoUserResponse kakaoUserResponse = null;
		
		try {
			kakaoUserResponse = objectMapper.readValue(responseUserInfo.getBody(), KakaoUserResponse.class);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return kakaoUserResponse;
	}
	
	
}
