package com.ffaikrw.space.wish.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ffaikrw.space.wish.model.Wish;

@Repository
public interface WishDAO {
	
	
	// 읽어볼까 추가
	public int insertWish(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
	// 읽어볼까 삭제
	public int deleteWish(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
	
	// 읽어볼까 여부 확인
	public int selectWishCount(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
	
	// 모든 읽어볼까 리스트 가져오기
	public List<Wish> selectWishlist(@Param("userId") int userId);
	
	
	// 읽어볼까 존재 여부 확인
	public int selectWishCountByUserId(@Param("userId") int userId);
	
	
	// 회원탈퇴 - 모든 읽어볼까 삭제
	public int deleteAllWish(@Param("userId") int userId);
	
}
