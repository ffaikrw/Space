package com.ffaikrw.space.author;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ffaikrw.space.author.bo.AuthorBO;
import com.ffaikrw.space.author.model.AuthorInfo;

@Controller
public class AuthorController {
	
	@Autowired
	private AuthorBO authorBO;
	
	
	// 작가의 저서 화면
	@GetMapping("/author")
	public String authorView(
			@RequestParam("author") String search,
			@RequestParam(value = "page", required = false) Integer startNum,
			Model model) {
		
		AuthorInfo authorInfo = authorBO.getAuthorInfo(search, startNum);
		model.addAttribute("author", authorInfo);
		
		return "author";
	}
	
}
