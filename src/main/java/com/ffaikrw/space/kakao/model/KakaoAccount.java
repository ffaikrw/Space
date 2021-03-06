package com.ffaikrw.space.kakao.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class KakaoAccount {
	
	@JsonProperty("profile_image_needs_agreement")
	private boolean profile_image_needs_agreement;
	private KakaoProfile profile;
	@JsonProperty("has_email")
	private boolean has_email;
	@JsonProperty("email_needs_agreement")
	private boolean email_needs_agreement;
	@JsonProperty("is_email_valid")
	private boolean is_email_valid;
	@JsonProperty("is_email_verified")
	private boolean is_email_verified;
	private String email;
	

	public boolean isProfile_image_needs_agreement() {
		return profile_image_needs_agreement;
	}
	public KakaoProfile getProfile() {
		return profile;
	}
	public boolean isHas_email() {
		return has_email;
	}
	public boolean isEmail_needs_agreement() {
		return email_needs_agreement;
	}
	public boolean isIs_email_valid() {
		return is_email_valid;
	}
	public boolean isIs_email_verified() {
		return is_email_verified;
	}
	public String getEmail() {
		return email;
	}
	public void setProfile_image_needs_agreement(boolean profile_image_needs_agreement) {
		this.profile_image_needs_agreement = profile_image_needs_agreement;
	}
	public void setProfile(KakaoProfile profile) {
		this.profile = profile;
	}
	public void setHas_email(boolean has_email) {
		this.has_email = has_email;
	}
	public void setEmail_needs_agreement(boolean email_needs_agreement) {
		this.email_needs_agreement = email_needs_agreement;
	}
	public void setIs_email_valid(boolean is_email_valid) {
		this.is_email_valid = is_email_valid;
	}
	public void setIs_email_verified(boolean is_email_verified) {
		this.is_email_verified = is_email_verified;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

}
