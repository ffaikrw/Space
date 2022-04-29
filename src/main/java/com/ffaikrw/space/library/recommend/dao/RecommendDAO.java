package com.ffaikrw.space.library.recommend.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ffaikrw.space.library.recommend.model.Recommend;

@Repository
public interface RecommendDAO {
	
	// 추천하기
	public int insertRecommend(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
	
	// 추천 취소
	public int deleteRecommend(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
	
	// 추천 여부
	public int selectRecommendCount(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
	
	// 추천 수
	public int selectRecommendCountByIsbn(@Param("isbn") String isbn13);
	
	
	// 추천 수 높은 순서대로 10개
	public List<Recommend> selectRecommendTop10();
	
}
