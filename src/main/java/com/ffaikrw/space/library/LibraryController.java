package com.ffaikrw.space.library;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ffaikrw.space.browse.model.BookInfo;
import com.ffaikrw.space.library.bo.LibraryBO;

@Controller
public class LibraryController {
	
	@Autowired
	private LibraryBO libraryBO;
	
	
	@GetMapping("/library")
	public String libraryView(
			HttpServletRequest request
			, Model model
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<BookInfo> bookInfo = libraryBO.getLibrary(userId);
		model.addAttribute("library", bookInfo);
		
		return "library/library";
	}
	
	
	
}
