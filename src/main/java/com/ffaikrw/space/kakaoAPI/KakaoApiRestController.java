package com.ffaikrw.space.kakaoAPI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ffaikrw.space.kakaoAPI.bo.KakaoApiBO;
import com.ffaikrw.space.kakaoAPI.model.KakaoResponse;

@RestController
public class KakaoApiRestController {
	
	@Autowired
	private KakaoApiBO kakaoApiBO;
	
	@GetMapping("/author_booklist")
	public KakaoResponse getAuthor() {
		
		return kakaoApiBO.getAuthor();
	}
	
	
}
