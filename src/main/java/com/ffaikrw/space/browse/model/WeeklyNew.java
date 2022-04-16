package com.ffaikrw.space.browse.model;

import java.util.List;

import com.ffaikrw.space.aladinAPI.model.AladinItem;
import com.ffaikrw.space.aladinAPI.model.AladinResponse;

public class WeeklyNew {
	
	private AladinResponse weeklyNewResponse;
	private List<AladinItem> weeklyNewList;
	private AladinItem weeklyNewItem;
	private boolean wishIsDuplicate;
	
	
	
	public AladinResponse getWeeklyNewResponse() {
		return weeklyNewResponse;
	}
	public void setWeeklyNewResponse(AladinResponse weeklyNewResponse) {
		this.weeklyNewResponse = weeklyNewResponse;
	}
	public List<AladinItem> getWeeklyNewList() {
		return weeklyNewList;
	}
	public void setWeeklyNewList(List<AladinItem> weeklyNewList) {
		this.weeklyNewList = weeklyNewList;
	}
	public AladinItem getWeeklyNewItem() {
		return weeklyNewItem;
	}
	public void setWeeklyNewItem(AladinItem weeklyNewItem) {
		this.weeklyNewItem = weeklyNewItem;
	}
	public boolean isWishIsDuplicate() {
		return wishIsDuplicate;
	}
	public void setWishIsDuplicate(boolean wishIsDuplicate) {
		this.wishIsDuplicate = wishIsDuplicate;
	}
	
}
