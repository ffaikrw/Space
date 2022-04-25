package com.ffaikrw.space.browse.model;

import java.util.Date;
import java.util.List;

import com.ffaikrw.space.aladinAPI.model.AladinSeriesInfo;

public class BookInfo {
	
	private BookResultInfo bookResultInfo;
	private String title;
	private List<String> authorList;
	private Date pubDate;
	private String description;
	private String isbn13;
	private String cover;
	private int categoryId;
	private String categoryName;
	private String publisher;
	private boolean adult;
	private int bestRank;
	private AladinSeriesInfo seriesInfo;
	private boolean wishIsDuplicate;
	private Date readDate;
	private boolean recommendIsDuplicate;
	private boolean noteIsDuplicate;
	private int recommendCount;
	
	public BookResultInfo getBookResultInfo() {
		return bookResultInfo;
	}
	public void setBookResultInfo(BookResultInfo bookResultInfo) {
		this.bookResultInfo = bookResultInfo;
	}
	public String getTitle() {
		return title;
	}
	public Date getPubDate() {
		return pubDate;
	}
	public String getDescription() {
		return description;
	}
	public String getIsbn13() {
		return isbn13;
	}
	public String getCover() {
		return cover;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public String getPublisher() {
		return publisher;
	}
	public boolean isAdult() {
		return adult;
	}
	public int getBestRank() {
		return bestRank;
	}
	public AladinSeriesInfo getSeriesInfo() {
		return seriesInfo;
	}
	public boolean isWishIsDuplicate() {
		return wishIsDuplicate;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public void setAdult(boolean adult) {
		this.adult = adult;
	}
	public void setBestRank(int bestRank) {
		this.bestRank = bestRank;
	}
	public void setSeriesInfo(AladinSeriesInfo seriesInfo) {
		this.seriesInfo = seriesInfo;
	}
	public void setWishIsDuplicate(boolean wishIsDuplicate) {
		this.wishIsDuplicate = wishIsDuplicate;
	}
	public Date getReadDate() {
		return readDate;
	}
	public void setReadDate(Date readDate) {
		this.readDate = readDate;
	}
	public boolean isRecommendIsDuplicate() {
		return recommendIsDuplicate;
	}
	public void setRecommendIsDuplicate(boolean recommendIsDuplicate) {
		this.recommendIsDuplicate = recommendIsDuplicate;
	}
	public boolean isNoteIsDuplicate() {
		return noteIsDuplicate;
	}
	public void setNoteIsDuplicate(boolean noteIsDuplicate) {
		this.noteIsDuplicate = noteIsDuplicate;
	}
	public int getRecommendCount() {
		return recommendCount;
	}
	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}
	public List<String> getAuthorList() {
		return authorList;
	}
	public void setAuthorList(List<String> authorList) {
		this.authorList = authorList;
	}
	
}
