package com.ffaikrw.space.aladinAPI.model;

import java.util.List;

public class AladinResponse {
	
	private String title;
	private int totalResults;
	private int startIndex;
	private int itemsPerPage;
	private String query;
	private int searchCategoryId;
	private String searchCategoryName;
	private List<AladinItem> item;
	
	
	public String getTitle() {
		return title;
	}
	public int getTotalResults() {
		return totalResults;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public int getItemsPerPage() {
		return itemsPerPage;
	}
	public String getQuery() {
		return query;
	}
	public int getSearchCategoryId() {
		return searchCategoryId;
	}
	public String getSearchCategoryName() {
		return searchCategoryName;
	}
	public List<AladinItem> getItem() {
		return item;
	}

}
