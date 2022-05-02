package com.ffaikrw.space.bookDetail.review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.bookDetail.review.dao.ReviewDAO;
import com.ffaikrw.space.bookDetail.review.model.Review;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	
	// 한 줄 평 리스트 가져오기
	public List<Review> getReviewList(String isbn13) {
		return reviewDAO.selectAllReview(isbn13);
	}
	
	
	// 한 줄 평 작성하기
	public int addReview(int userId, String isbn13, String nickname, String comment) {
		return reviewDAO.insertReview(userId, isbn13, nickname, comment);
	}
	
	
	// 한 줄 평 삭제하기
	public int deleteReview(int id) {
		return reviewDAO.deleteReview(id);
	}
	
	
	// 한 줄 평 존재 여부
	public boolean reviewIsExist(int userId) {
		
		int count = reviewDAO.selectReviewCountByUserId(userId);
		
		return !(count == 0);
	}
	
	
	// 회원탈퇴 - 모든 한 줄 평 삭제
	public int deleteAllReview(int userId) {
		return reviewDAO.deleteAllReview(userId);
	}
	
	
}
