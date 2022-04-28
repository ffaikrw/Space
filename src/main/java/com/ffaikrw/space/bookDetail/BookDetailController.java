package com.ffaikrw.space.bookDetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ffaikrw.space.bookDetail.bo.BookDetailBO;
import com.ffaikrw.space.browse.model.BookInfo;

@Controller
public class BookDetailController {
	
	@Autowired
	private BookDetailBO bookDetailBO;
	
	
	@GetMapping("/book_info")
	public String bookInfoView(
			@RequestParam("isbn13") String isbn13
			, HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		BookInfo bookInfo = bookDetailBO.getBookDetail(userId, isbn13);
		model.addAttribute("bookDetail", bookInfo);
		
		return "bookDetail";
	}
	
}
