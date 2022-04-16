package com.ffaikrw.space.aladinAPI.bo;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.ffaikrw.space.aladinAPI.model.AladinResponse;

@Service
public class AladinApiBO {
	
	private final String key = "ttbjhwn02021645001";
	
	private final String itemNewAllUrl = "http://www.aladin.co.kr/ttb/api/ItemList.aspx"
			+ "?ttbkey=" + key
			+ "&QueryType={query}&MaxResults={maxResults}&start=1&SearchTarget=Book&output=js&Cover={coverSize}&CategoryId=1&Version=20131101";
	
	private final String itemLookUpUrl = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx"
			+ "?ttbkey=" + key
			+ "&itemIdType=ISBN13"
			+ "&ItemId={isbn13}"
			+ "&Cover=big"
			+ "&output=js&Version=20131101";
	
	
	
	// 이번 주 신작 리스트
	public AladinResponse getItemNewAll(String query, int maxResults, String coverSize) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders();
		
		HttpEntity<String> entity = new HttpEntity<>(header);
		
		return restTemplate.exchange(
				itemNewAllUrl
				, HttpMethod.GET
				, entity
				, AladinResponse.class
				, query
				, maxResults
				, coverSize
				).getBody();
		
	}
	
	
	// 도서 상세 정보
	public AladinResponse getItemLookUp(String isbn13) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders();
		
		HttpEntity<String> entity = new HttpEntity<>(header);
		
		return restTemplate.exchange(
				itemLookUpUrl
				, HttpMethod.GET
				, entity
				, AladinResponse.class
				, isbn13
				).getBody();
	}
	
	
	
	
}
