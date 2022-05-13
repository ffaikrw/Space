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
import com.ffaikrw.space.browse.model.BookResultInfo;
import com.ffaikrw.space.browse.model.Home;

@Controller
@RequestMapping("/browse")
public class BrowseController {
	
	@Autowired
	private BrowseBO browseBO;
	
	
	// 홈 화면
	@GetMapping("/home")
	public String homeView(
			HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		Home home = browseBO.getHome(userId);
		model.addAttribute("home", home);
		
		return "/browse/home";
	}
	
	
	// 이번 주 신작 화면
	@GetMapping("/weekly_new")
	public String weeklyNew(
			@RequestParam(value = "page", required = false) Integer startNum
			, HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		String itemListType = "ItemNewAll";
		int maxResults = 50;
		String coverSize = "MidBig";
		
		if (startNum == null) {
			startNum = 1;
		}
		
		List<BookInfo> bookInfoList = browseBO.getBookList(userId, itemListType, maxResults, startNum, coverSize);
		model.addAttribute("weeklyNew", bookInfoList);
		
		return "/browse/weeklyNew";
	}
	
	
	// 베스트셀러 화면
	@GetMapping("/bestseller")
	public String bestsellerView(
			@RequestParam(value = "page", required = false) Integer startNum
			, HttpServletRequest request
			, Model model
			) {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		String itemListType = "Bestseller";
		int maxResults = 50;
		String coverSize = "MidBig";
		
		if (startNum == null) {
			startNum = 1;
		}
		
		List<BookInfo> bookInfoList = browseBO.getBookList(userId, itemListType, maxResults, startNum, coverSize);
		model.addAttribute("bestseller", bookInfoList);
		
		return "/browse/bestseller";
	}
	
	
	// 편집자 추천 소설 화면
	@GetMapping("/editor_recommend")
	public String editorRecommendView(
			@RequestParam(value = "page", required = false) Integer startNum
			, HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		String itemListType = "ItemEditorChoice";
		int maxResults = 50;
		String coverSize = "MidBig";
		
		if (startNum == null) {
			startNum = 1;
		}
		
		List<BookInfo> bookInfoList = browseBO.getBookList(userId, itemListType, maxResults, startNum, coverSize);
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
		int maxResults = 50;
		String coverSize = "Mid";
		Integer startNum = 1;
		
		List<BookInfo> bookInfoList = browseBO.getBookList(userId, itemListType, maxResults, startNum, coverSize);
		model.addAttribute("outstandingBook", bookInfoList);
		
		return "/browse/search";
	}
	
	
	// 검색 결과 화면
	@GetMapping("/search_result")
	public String searchResultView(
			@RequestParam("search") String search
			, @RequestParam(value = "page", required = false) Integer startNum
			, Model model) {
		
		String keyword = "Keyword";
		String sort = "Accuracy";
		
		if (startNum == null) {
			startNum = 1;
		}
		
		List<BookInfo> bookInfoList = browseBO.getSearchResult(search, keyword, startNum, sort);
		model.addAttribute("search", bookInfoList);
		
		BookResultInfo bookResultInfo = new BookResultInfo();
		model.addAttribute("pageNumber", bookResultInfo);
		
		return "/browse/searchResult";
	}
	
}
