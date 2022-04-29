package com.ffaikrw.space.library.recommend.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.library.recommend.dao.RecommendDAO;
import com.ffaikrw.space.library.recommend.model.Recommend;

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
	
	
	// 추천 수
	public int getRecommendCount(String isbn13) {
		return recommendDAO.selectRecommendCountByIsbn(isbn13);
	}
	
	
	// 추천 수 높은 순서대로 10개
	public List<Recommend> getRecommendTop10() {
		return recommendDAO.selectRecommendTop10();
	}
	
}
