package com.ffaikrw.space.kakao.model;

import java.util.Date;

public class KakaoUserResponse {
	
	private int id;
	private Date connected_at;
	private KakaoAccount kakao_account;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getConnected_at() {
		return connected_at;
	}
	public void setConnected_at(Date connected_at) {
		this.connected_at = connected_at;
	}
	public KakaoAccount getKakao_account() {
		return kakao_account;
	}
	public void setKakao_account(KakaoAccount kakao_account) {
		this.kakao_account = kakao_account;
	}
	
}
