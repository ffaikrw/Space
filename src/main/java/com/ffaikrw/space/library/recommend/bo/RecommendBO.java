package com.ffaikrw.space.library.recommend.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.library.recommend.dao.RecommendDAO;

@Service
public class RecommendBO {
	
	@Autowired
	private RecommendDAO recommendDAO;
	
	
	// 추천하기
	public int addRecommend(int userId, String isbn13) {
		return recommendDAO.insertRecommend(userId, isbn13);
	}
	
	
	// 추천 취소
	public int deleteRecommend(int userId, String isbn13) {
		return recommendDAO.deleteRecommend(userId, isbn13);
	}
	
	
	// 추천 여부
	public boolean recommendIsDuplicate(int userId, String isbn13) {
		
		int count = recommendDAO.selectRecommendCount(userId, isbn13);
		
		return (count != 0);
	}
	
	
	
}
