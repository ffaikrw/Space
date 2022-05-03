package com.ffaikrw.space.kakao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ffaikrw.space.kakao.bo.KakaoBO;
import com.ffaikrw.space.kakao.model.KakaoTokenResponse;

@RestController
public class KakaoRestController {
	
	@Autowired
	private KakaoBO kakaoBO;
	
	// 인가 코드 요청
	@GetMapping("/kakao/login")
	public String getKakaoLoginUrl() {
		
		String kakaoLoginUrl = "https://kauth.kakao.com/oauth/authorize?"
							+ "client_id=5170fc7c6355db5c1438e9b2e64d78bb"
							+ "&redirect_uri=http://localhost:8080/oauth/kakaoLogin"
							+ "&response_type=code";
		
		return kakaoLoginUrl;
	}
	
	
	// 인가 코드 받기
	@GetMapping("/oauth/kakaoLogin")
	public @ResponseBody String getOauthCode(
			@RequestParam(value = "code", required = false) String code
			) {
		
		KakaoTokenResponse reqToken = kakaoBO.getToken(code);
		
		String access_token = reqToken.getAccess_token();
		
		return access_token;
	}
	
	
	
	
	
	
	
}
