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
	
	private final String itemLookUpUrl = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx"
			+ "?ttbkey=" + key
			+ "&itemIdType=ISBN13"
			+ "&ItemId={isbn13}"
			+ "&Cover=big"
			+ "&output=js&Version=20131101";
	
	private final String itemSearchUrl = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx"
			+ "?ttbkey=" + key
			+ "&Query={search}"
			+ "&SearchTarget=Book"
			+ "&MaxResults=50"
			+ "&Start=1"
			+ "&Sort={sort}"
			+ "&Cover=MidBig"
			+ "&CategoryId=1"
			+ "&output=js"
			+ "&Version=20131101";
	
	private final String itemListUrl = "https://www.aladin.co.kr/ttb/api/ItemList.aspx"
			+ "?ttbkey=" + key
			+ "&QueryType={itemListType}"
			+ "&MaxResults=50"
			+ "&start=1"
			+ "&CategoryId=1"
			+ "&Cover={coverSize}"
			+ "&SearchTarget=Book"
			+ "&output=js"
			+ "&Version=20131101";
	
	
	
	
	// 도서 리스트
	public AladinResponse getItemList(String itemListType, String coverSize) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders();
		
		HttpEntity<String> entity = new HttpEntity<>(header);
		
		return restTemplate.exchange(
				itemListUrl
				, HttpMethod.GET
				, entity
				, AladinResponse.class
				, itemListType
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
	
	
	
	// 도서 검색
	public AladinResponse getItemSearch(String search, String sort) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders();
		
		HttpEntity<String> entity = new HttpEntity<>(header);
		
		return restTemplate.exchange(
				itemSearchUrl
				, HttpMethod.GET
				, entity
				, AladinResponse.class
				, search
				, sort
				).getBody();
	}
	
	
	
}