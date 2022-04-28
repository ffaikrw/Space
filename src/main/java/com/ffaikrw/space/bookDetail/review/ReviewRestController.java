package com.ffaikrw.space.bookDetail.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ffaikrw.space.bookDetail.review.bo.ReviewBO;

@RestController
@RequestMapping("/review")
public class ReviewRestController {
	
	@Autowired
	private ReviewBO reviewBO;
	
	
	// 한 줄 평 작성
	@PostMapping("/add_review")
	public Map<String, String> addReview(
			@RequestParam("isbn13") String isbn13
			, @RequestParam("comment") String comment
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String nickname = (String)session.getAttribute("userNickname");
		
		int count = reviewBO.addReview(userId, isbn13, nickname, comment);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	// 한 줄 평 삭제
	@GetMapping("/delete_review")
	public Map<String, String> deleteReview(
			@RequestParam("id") int id
			) {
		
		int count = reviewBO.deleteReview(id);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count != 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	
	
}
