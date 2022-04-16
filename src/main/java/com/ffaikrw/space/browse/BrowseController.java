package com.ffaikrw.space.browse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ffaikrw.space.browse.bo.BrowseBO;
import com.ffaikrw.space.browse.model.WeeklyNew;

@Controller
@RequestMapping("/browse")
public class BrowseController {
	
	@Autowired
	private BrowseBO browseBO;
	
	
	// 홈 화면
	@GetMapping("/home")
	public String homeView() {
		return "/browse/home";
	}
	
	
	// 이번 주 신작 화면
	@GetMapping("/weekly_new")
	public String weeklyNew(
			HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		WeeklyNew weeklyNew = browseBO.getWeeklyNewItems(userId);
		model.addAttribute("weeklyNew", weeklyNew);
		
		return "/browse/weeklyNew";
	}
	
	
}
