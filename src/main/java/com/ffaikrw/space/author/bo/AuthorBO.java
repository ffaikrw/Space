package com.ffaikrw.space.author.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.author.model.AuthorInfo;
import com.ffaikrw.space.kakaoAPI.bo.KakaoApiBO;

@Service
public class AuthorBO {
	
	@Autowired
	private KakaoApiBO kakaoApiBO;
	
	public AuthorInfo getAuthor(String author, String target, int size) {
		
		AuthorInfo authorInfo = new AuthorInfo();
		
		authorInfo.setAuthorInfo(kakaoApiBO.getAuthor(author, target, size));
		
		return authorInfo;
		
	}
	
}
