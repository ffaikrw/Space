package com.ffaikrw.space.kakao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ffaikrw.space.kakao.bo.KakaoBO;
import com.ffaikrw.space.kakao.model.KakaoTokenResponse;
import com.ffaikrw.space.kakao.model.KakaoUserResponse;

@RestController
public class KakaoRestController {
	
	@Autowired
	private KakaoBO kakaoBO;
	
	// 인가 코드 요청
	@GetMapping("/kakao/login")
	public String getKakaoLoginUrl() {
		
		String kakaoLoginUrl = "https://kauth.kakao.com/oauth/authorize?"
							+ "client_id=5170fc7c6355db5c1438e9b2e64d78bb"
							+ "&redirect_uri=http://localhost:8080/user/oauth/kakaoLogin"
							+ "&response_type=code";
		
		return kakaoLoginUrl;
	}
	
	
	// 인가 코드 받기
//	@GetMapping("/user/oauth/kakaoLogin")
//	public @ResponseBody String getOauthCode(
//			@RequestParam(value = "code", required = false) String code
//			, Model model
//			) {
//		
//		// 토큰 발급
//		KakaoTokenResponse responseToken = kakaoBO.getToken(code);
//		
//		// access_token으로 사용자 정보 가져오기
//		KakaoUserResponse response = kakaoBO.getUserInfo(responseToken.getAccess_token());
////		model.addAttribute("kakaoUserInfo", responseUserInfo);
//		
//		return "kakao userInfo" + response.getId();
//	}
	
	
	
	
	
	
	
}
