package com.ffaikrw.space.kakao;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class KakaoRestController {
	
	// 인가 코드 요청
	@GetMapping("/kakao/login")
	public String getKakaoLoginUrl() {
		
		String kakaoLoginUrl = "https://kauth.kakao.com/oauth/authorize?"
							+ "client_id=5170fc7c6355db5c1438e9b2e64d78bb"
							+ "&redirect_uri=http://localhost:8080/user/oauth/kakaoLogin"
							+ "&response_type=code";
		
		return kakaoLoginUrl;
	}
	
}
