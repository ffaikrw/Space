package com.ffaikrw.space.library.recommend;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ffaikrw.space.library.recommend.bo.RecommendBO;

@RestController
@RequestMapping("/library")
public class RecommendRestController {
	
	@Autowired
	private RecommendBO recommendBO;
	
	
	// 추천하기
	@GetMapping("/recommend_api")
	public Map<String, String> addRecommend(
			HttpServletRequest request
			, @RequestParam("isbn13") String isbn13
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = recommendBO.addRecommend(userId, isbn13);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	// 추천 취소
	@GetMapping("/deleteRecommend_api")
	public Map<String, String> deleteRecommend(
			HttpServletRequest request
			, @RequestParam("isbn13") String isbn13
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = recommendBO.deleteRecommend(userId, isbn13);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	

}
