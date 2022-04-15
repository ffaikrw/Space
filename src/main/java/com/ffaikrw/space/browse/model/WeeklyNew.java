package com.ffaikrw.space.browse.model;

import com.ffaikrw.space.aladinAPI.model.AladinItem;

public class WeeklyNew {
	
	private AladinItem weeklyNew;
	private boolean wishIsDuplicate;
	
	
	public AladinItem getWeeklyNew() {
		return weeklyNew;
	}
	public boolean isWishIsDuplicate() {
		return wishIsDuplicate;
	}
	public void setWeeklyNew(AladinItem weeklyNew) {
		this.weeklyNew = weeklyNew;
	}
	public void setWishIsDuplicate(boolean wishIsDuplicate) {
		this.wishIsDuplicate = wishIsDuplicate;
	}

}
