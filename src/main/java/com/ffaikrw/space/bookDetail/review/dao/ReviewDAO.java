package com.ffaikrw.space.bookDetail.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ffaikrw.space.bookDetail.review.model.Review;

@Repository
public interface ReviewDAO {
	
	// 한 줄 평 전체 가져오기
	public List<Review> selectAllReview(@Param("isbn") String isbn13);
	
	
	// 한 줄 평 작성
	public int insertReview(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			, @Param("nickname") String nickname
			, @Param("comment") String comment
			);
	
	
	// 한 줄 평 삭제
	public int deleteReview(@Param("id") int id);
	
	
	// 한 줄 평 존재 여부
	public int selectReviewCountByUserId(@Param("userId") int userId);
	
	
	// 회원탈퇴 - 모든 한 줄 평 삭제
	public int deleteAllReview(@Param("userId") int userId);
	
}
