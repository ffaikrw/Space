package com.ffaikrw.space.bookInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ffaikrw.space.bookInfo.bo.BookInfoBO;
import com.ffaikrw.space.bookInfo.model.BookInfo;

@Controller
public class BookInfoController {
	
	@Autowired
	private BookInfoBO bookInfoBO;
	
	
	@GetMapping("/book_info")
	public String bookInfoView(
			@RequestParam("isbn13") String isbn13
			, Model model) {
		
		BookInfo bookInfo = bookInfoBO.getBookInfo(isbn13);
		model.addAttribute("bookInfo", bookInfo);
		
		return "bookInfo";
	}
	
}
