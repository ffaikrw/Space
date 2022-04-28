package com.ffaikrw.space.bookDetail.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ffaikrw.space.bookDetail.review.model.Review;

@Repository
public interface ReviewDAO {
	
	// 한 줄 평 리스트 3개만 가져오기
	public List<Review> selectReviewLimit3(@Param("isbn") String isbn13);
	
	
	// 한 줄 평 전체 가져오기
	public List<Review> selectAllReview(@Param("isbn") String isbn13);
	
	
}
