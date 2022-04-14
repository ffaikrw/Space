package com.ffaikrw.space.browse.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.aladinAPI.bo.AladinApiBO;
import com.ffaikrw.space.browse.model.WeeklyNew;

@Service
public class BrowseBO {
	
	@Autowired
	private AladinApiBO aladinApiBO;;
	
	
	// 이번 주 신간
	public WeeklyNew getWeeklyNew(String query, int maxResults, String coverSize) {
		
		WeeklyNew weeklyNew = new WeeklyNew();
		
		weeklyNew.setWeeklyNew(aladinApiBO.getItemNewAll(query, maxResults, coverSize));
		
		return weeklyNew;
		
	}
	
	
}
