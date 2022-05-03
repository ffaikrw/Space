package com.ffaikrw.space.kakao.model;

public class KakaoTokenResponse {
	
	private String token_type;
	private String access_token;
	private String id_token;
	private Integer expires_in;
	private String refresh_token;
	private Integer refresh_token_expires_in;
	private String scope;
	
	public String getToken_type() {
		return token_type;
	}
	public String getAccess_token() {
		return access_token;
	}
	public String getId_token() {
		return id_token;
	}
	public Integer getExpires_in() {
		return expires_in;
	}
	public String getRefresh_token() {
		return refresh_token;
	}
	public Integer getRefresh_token_expires_in() {
		return refresh_token_expires_in;
	}
	public String getScope() {
		return scope;
	}
	
}
