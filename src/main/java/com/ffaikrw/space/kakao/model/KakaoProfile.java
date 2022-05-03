package com.ffaikrw.space.kakao.model;

public class KakaoProfile {
	
	private String thumbnail_image_url;
	private String profile_image_url;
	private boolean is_default_image;
	
	public String getThumbnail_image_url() {
		return thumbnail_image_url;
	}
	public void setThumbnail_image_url(String thumbnail_image_url) {
		this.thumbnail_image_url = thumbnail_image_url;
	}
	public String getProfile_image_url() {
		return profile_image_url;
	}
	public void setProfile_image_url(String profile_image_url) {
		this.profile_image_url = profile_image_url;
	}
	public boolean isIs_default_image() {
		return is_default_image;
	}
	public void setIs_default_image(boolean is_default_image) {
		this.is_default_image = is_default_image;
	}
	
}
