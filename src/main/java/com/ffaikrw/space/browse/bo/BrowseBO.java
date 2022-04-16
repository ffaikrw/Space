package com.ffaikrw.space.browse.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.aladinAPI.bo.AladinApiBO;
import com.ffaikrw.space.browse.model.WeeklyNew;
import com.ffaikrw.space.wish.bo.WishBO;

@Service
public class BrowseBO {
	
	@Autowired
	private AladinApiBO aladinApiBO;
	
	@Autowired
	private WishBO wishBO;
	
	
	
	// 이번 주 신간
	public List<WeeklyNew> getWeeklyNewItems(int userId) {
		
		String query = "ItemNewAll";
		int maxResults = 100;
		String coverSize = "MidBig";
		
		WeeklyNew weeklyNew = new WeeklyNew();
		weeklyNew.setWeeklyNewResponse(aladinApiBO.getItemNewAll(query, maxResults, coverSize));
		
		weeklyNew.setWeeklyNewList(null);
		
		List<WeeklyNew> weeklyNewItemList = weeklyNew.getWeeklyNewList();
		
		for() {
			
		}
		

		if (userId != null) {
			
			boolean wishIdDuplicate = wishBO.wishIdDuplicate(userId, isbn13);
			
			weeklyNew.setWishIsDuplicate(wishIdDuplicate);
		}
		
		
		return weeklyNew;
		
	}
	
	
}
