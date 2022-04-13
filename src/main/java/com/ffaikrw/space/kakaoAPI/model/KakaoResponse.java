package com.ffaikrw.space.kakaoAPI.model;

import java.util.List;

public class KakaoResponse {
	
	private KakaoMeta meta;
	private List<KakaoDocument> documents;
	
	public KakaoMeta getMeta() {
		return meta;
	}

	public List<KakaoDocument> getDocuments() {
		return documents;
	}
	
}
