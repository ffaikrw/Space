package com.ffaikrw.space.browse.model;

import java.util.List;

public class Home {
	
	private BookInfo homeWeeklyNew;
	private BookInfo homeBestseller;
	private BookInfo homeEditorRecommend;
	private List<BookInfo> todayTop10;
	private List<BookInfo> homeWishlist;
	private List<BookInfo> homeAuthorList;
	private List<BookInfo> homeLibrary;
	public BookInfo getHomeWeeklyNew() {
		return homeWeeklyNew;
	}
	public void setHomeWeeklyNew(BookInfo homeWeeklyNew) {
		this.homeWeeklyNew = homeWeeklyNew;
	}
	public BookInfo getHomeBestseller() {
		return homeBestseller;
	}
	public void setHomeBestseller(BookInfo homeBestseller) {
		this.homeBestseller = homeBestseller;
	}
	public BookInfo getHomeEditorRecommend() {
		return homeEditorRecommend;
	}
	public void setHomeEditorRecommend(BookInfo homeEditorRecommend) {
		this.homeEditorRecommend = homeEditorRecommend;
	}
	public List<BookInfo> getTodayTop10() {
		return todayTop10;
	}
	public void setTodayTop10(List<BookInfo> todayTop10) {
		this.todayTop10 = todayTop10;
	}
	public List<BookInfo> getHomeWishlist() {
		return homeWishlist;
	}
	public void setHomeWishlist(List<BookInfo> homeWishlist) {
		this.homeWishlist = homeWishlist;
	}
	public List<BookInfo> getHomeAuthorList() {
		return homeAuthorList;
	}
	public void setHomeAuthorList(List<BookInfo> homeAuthorList) {
		this.homeAuthorList = homeAuthorList;
	}
	public List<BookInfo> getHomeLibrary() {
		return homeLibrary;
	}
	public void setHomeLibrary(List<BookInfo> homeLibrary) {
		this.homeLibrary = homeLibrary;
	}
	
	
	
}
