package com.ffaikrw.space.browse;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ffaikrw.space.browse.bo.BrowseBO;
import com.ffaikrw.space.browse.model.BookInfo;

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
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		String itemListType = "ItemNewAll";
		String coverSize = "MidBig";
		
		List<BookInfo> bookInfoList = browseBO.getBookList(userId, itemListType, coverSize);
		model.addAttribute("weeklyNew", bookInfoList);
		
		return "/browse/weeklyNew";
	}
	
	
	// 베스트셀러 화면
	@GetMapping("/bestseller")
	public String bestsellerView(
			HttpServletRequest request
			, Model model
			) {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		String itemListType = "Bestseller";
		String coverSize = "MidBig";
		
		List<BookInfo> bookInfoList = browseBO.getBookList(userId, itemListType, coverSize);
		model.addAttribute("bestseller", bookInfoList);
		
		return "/browse/bestseller";
	}
	
	
	// 편집자 추천 소설 화면
	@GetMapping("/editor_recommend")
	public String editorRecommendView(
			HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		String itemListType = "ItemEditorChoice";
		String coverSize = "MidBig";
		
		List<BookInfo> bookInfoList = browseBO.getBookList(userId, itemListType, coverSize);
		model.addAttribute("editorRecommend", bookInfoList);
		
		return "/browse/editorRecommend";
	}
	
	
	
	// 검색 및 주목할만한 신작 화면
	@GetMapping("/search")
	public String searchView(
			HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		String itemListType = "ItemNewSpecial";
		String coverSize = "Mid";
		
		List<BookInfo> bookInfoList = browseBO.getBookList(userId, itemListType, coverSize);
		model.addAttribute("outstandingBook", bookInfoList);
		
		return "/browse/search";
	}
	
	
	// 검색 결과 화면
	@GetMapping("/search_result")
	public String searchResultView(
			@RequestParam("search") String search
			, Model model) {
		
		String keyword = "Keyword";
		String sort = "Accuracy";
		
		List<BookInfo> bookInfoList = browseBO.getSearchResult(search, keyword, sort);
		model.addAttribute("search", bookInfoList);
		
		return "/browse/searchResult";
	}
	
}
