package com.ffaikrw.space.wish;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ffaikrw.space.wish.bo.WishBO;

@RestController
@RequestMapping("/wishlist")
public class WishRestController {
	
	@Autowired
	private WishBO wishBO;
	
	
	// 읽어볼까 추가
	@GetMapping("/addBook_api")
	public Map<String, String> addWish(
			@RequestParam("isbn13") String isbn13
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();;
		int userId = (Integer)session.getAttribute("userId");
		
		int count = wishBO.addWist(userId, isbn13);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	
	// 읽어볼까 삭제
	@GetMapping("/deleteBook_api")
	public Map<String, String> deleteWish(
			@RequestParam("isbn13") String isbn13
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();;
		int userId = (Integer)session.getAttribute("userId");
		
		int count = wishBO.deleteWish(userId, isbn13);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
}
