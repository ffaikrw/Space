package com.ffaikrw.space.library;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ffaikrw.space.library.bo.LibraryBO;

@RestController
@RequestMapping("/library")
public class LibraryRestController {
	
	@Autowired
	private LibraryBO libraryBO;
	
	
	// 내 서재에 담기
	@GetMapping("/addBook_api")
	public Map<String, String> addLibrary(
			@RequestParam("isbn13") String isbn13
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = libraryBO.addLibrary(userId, isbn13);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	// 내 서재에서 삭제
	@GetMapping("/deleteBook_api")
	public Map<String, String> deleteLibrary(
			@RequestParam("isbn13") String isbn13
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = libraryBO.deleteLibrary(userId, isbn13);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
	// 완독 날짜 수정
	@GetMapping("/update_readDate")
	public Map<String, String> editReadDate(
			@RequestParam("isbn13") String isbn13
			, @RequestParam("readDate") String readDate
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = libraryBO.editReadDate(userId, isbn13, readDate);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	
}
