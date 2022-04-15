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
	public List<WeeklyNew> getWeeklyNewItems(int userId, String isbn13, String query, int maxResults, String coverSize) {
		
		aladinApiBO.getItemNewAll(query, maxResults, coverSize);
		
		WeeklyNew weeklyNew = new WeeklyNew();
		
		weeklyNew.setWeeklyNew(aladinApiBO.getItemNewAll(query, maxResults, coverSize));
		
		if (userId != null) {
			
			boolean userLikeDuplicate = wishBO.wishIdDuplicate(userId, isbn13);
			
			postDetail.setUserLikeDuplicate(userLikeDuplicate);
			
		}
		
		
		return weeklyNew;
		
	}
	
	
}
