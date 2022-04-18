package com.ffaikrw.space.wish;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ffaikrw.space.browse.model.BookInfo;
import com.ffaikrw.space.wish.bo.WishBO;

@Controller
public class WishController {
	
	@Autowired
	private WishBO wishBO;
	
	
	@GetMapping("/wishlist")
	public String wishView(
			HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<BookInfo> bookInfo = wishBO.getWishlist(userId);
		model.addAttribute("wishlist", bookInfo);
		
		return "wishlist";
	}
	
}
