package com.ffaikrw.space.browse;

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
	public String weeklyNew(Model model) {
		
		String query = "ItemNewAll";
		int maxResults = 100;
		String coverSize = "MidBig";
		
		WeeklyNew weeklyNew = browseBO.getWeeklyNew(query, maxResults, coverSize);
		model.addAttribute("weeklyNew", weeklyNew);
		
		return "/browse/weeklyNew";
	}
	
	
}
