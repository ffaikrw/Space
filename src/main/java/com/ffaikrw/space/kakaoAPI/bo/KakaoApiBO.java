package com.ffaikrw.space.kakaoAPI.bo;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.ffaikrw.space.kakaoAPI.model.KakaoResponse;

@Service
public class KakaoApiBO {
	
	RestTemplate restTemplate = new RestTemplate();
	
	private final String key = "5170fc7c6355db5c1438e9b2e64d78bb";
	private final String kakaoApiUrl = "https://dapi.kakao.com/v3/search/book?query=히가시노게이고&target=author";
	
	public KakaoResponse getAuthor() {
		
		HttpHeaders header = new HttpHeaders();
		header.set("key", key);
		
		HttpEntity<String> entity = new HttpEntity<>(header);
		
		return restTemplate.exchange(kakaoApiUrl, HttpMethod.GET, entity, KakaoResponse.class).getBody();
		
		
	}
	
}
