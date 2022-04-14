package com.ffaikrw.space.bookInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookInfoController {
	
	
	@GetMapping("/book_info")
	public String bookInfoView() {
		
		
		return "bookInfo";
	}
	
}
