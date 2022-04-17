package com.ffaikrw.space.browse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ffaikrw.space.browse.bo.BrowseBO;
import com.ffaikrw.space.browse.model.Bestseller;
import com.ffaikrw.space.browse.model.EditorRecommend;
import com.ffaikrw.space.browse.model.Outstanding;
import com.ffaikrw.space.browse.model.Search;

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
//	@GetMapping("/weekly_new")
//	public String weeklyNew(
//			HttpServletRequest request
//			, Model model) {
//		
//		HttpSession session = request.getSession();
//		
//		int userId = (Integer)session.getAttribute("userId");
//		
//		WeeklyNew weeklyNew = browseBO.getWeeklyNewItems(userId);
//		model.addAttribute("weeklyNew", weeklyNew);
//		
//		return "/browse/weeklyNew";
//	}
	
	
	// 베스트셀러 화면
	@GetMapping("/bestseller")
	public String bestsellerView(Model model) {
		
		Bestseller bestsellerList = browseBO.getBestseller();
		model.addAttribute("bestsellerList", bestsellerList);
		
		return "/browse/bestseller";
	}
	
	
	// 편집자 추천 소설 화면
	@GetMapping("/editor_recommend")
	public String editorRecommendView(Model model) {
		
		EditorRecommend editorRecommendList = browseBO.getEditorRecommend();
		model.addAttribute("editorRecommendList", editorRecommendList);
		
		return "/browse/editorRecommend";
	}
	
	
	
	// 검색 화면
	@GetMapping("/search")
	public String searchView(Model model) {
		
		Outstanding outstandingBook = browseBO.getOutstandinBook();
		model.addAttribute("outstandingBook", outstandingBook);
		
		
		return "/browse/search";
	}
	
	
	// 검색 결과 화면
	@GetMapping("/search_result")
	public String searchResultView(
			@RequestParam("search") String search
			, Model model) {
		
		Search searchResult = browseBO.getSearchResult(search);
		model.addAttribute("search", searchResult);
		
		return "/browse/searchResult";
	}
	
}
