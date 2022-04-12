package com.ffaikrw.space.author;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthorController {
	
	
	// 작가의 저서 화면
	@GetMapping("/author")
	public String authorView() {
		return "author";
	}
	
}
