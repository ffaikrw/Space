package com.ffaikrw.space.note;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ffaikrw.space.note.bo.NoteBO;

@RestController
@RequestMapping("/library")
public class NoteRestController {
	
	@Autowired
	private NoteBO noteBO;
	
	
	// 독서노트 작성
	@PostMapping("/createNote_api")
	public Map<String, String> createNote(
			@RequestParam("isbn13") String isbn13
			, @RequestParam("content") String content
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = noteBO.createNote(userId, isbn13, content);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	
}
