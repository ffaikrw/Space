package com.ffaikrw.space.wish.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
	
	
}
