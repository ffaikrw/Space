package com.ffaikrw.space.library.recommend.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
	
}
