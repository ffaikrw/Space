package com.ffaikrw.space.library;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ffaikrw.space.browse.model.BookInfo;
import com.ffaikrw.space.library.bo.LibraryBO;
import com.ffaikrw.space.library.model.Calendar;

@Controller
public class LibraryController {
	
	@Autowired
	private LibraryBO libraryBO;
	
	// 내 서재
	@GetMapping("/library")
	public String libraryView(
			HttpServletRequest request
			, Model model
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		String coverSize = "MidBig";
		
		List<BookInfo> bookInfo = libraryBO.getLibrary(userId, coverSize);
		model.addAttribute("library", bookInfo);
		
		return "library/library";
	}
	
	
	// 독서 캘린더 화면
	@GetMapping("/library/calendar")
	public String calendar() {
		return "library/calendar";
	}
	
	
	
	// 캘린더에 내 서재 데이터 가져오기
	@GetMapping("/library/get_calendar")
	public @ResponseBody List<Calendar> getCalendar(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<Calendar> calendarList = libraryBO.calendar(userId);
		
		return calendarList;
	}
	
	
}
