package com.ffaikrw.space.aladinAPI.model;

import java.util.Date;

public class AladinItem {
	
	private String title;
	private String author;
	private Date pubDate;
	private String description;
	private String isbn;
	private String isbn13;
	private String cover;
	private int categoryId;
	private String categoryName;
	private String publisher;
	private boolean adult;
	private String bestDuration;
	private int bestRank;
	private AladinSeriesInfo seriesInfo;
	
	
	public String getTitle() {
		return title;
	}
	public String getAuthor() {
		return author;
	}
	public Date getPubDate() {
		return pubDate;
	}
	public String getDescription() {
		return description;
	}
	public String getIsbn() {
		return isbn;
	}
	public String getIsbn13() {
		return isbn13;
	}
	public String getCover() {
		return cover;
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
	public String getBestDuration() {
		return bestDuration;
	}
	public int getBestRank() {
		return bestRank;
	}
	public AladinSeriesInfo getSeriesInfo() {
		return seriesInfo;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}
	public void setCover(String cover) {
		this.cover = cover;
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
	public void setBestDuration(String bestDuration) {
		this.bestDuration = bestDuration;
	}
	public void setBestRank(int bestRank) {
		this.bestRank = bestRank;
	}
	public void setSeriesInfo(AladinSeriesInfo seriesInfo) {
		this.seriesInfo = seriesInfo;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	
		
}
