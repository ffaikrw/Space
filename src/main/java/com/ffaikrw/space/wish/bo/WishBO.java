package com.ffaikrw.space.wish.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.wish.dao.WishDAO;

@Service
public class WishBO {
	
	@Autowired
	private WishDAO wishDAO;
	
	
	// 읽어볼까 추가
	public int addWist(int userId, String isbn13) {
		return wishDAO.insertWish(userId, isbn13);
	}
	
	
	// 읽어볼까 삭제
	public int deleteWish(int userId, String isbn13) {
		return wishDAO.deleteWish(userId, isbn13);
	}
	
	
	// 읽어볼까 여부 확인
	public boolean wishIdDuplicate(int userId, String isbn13) {
		
		int count = wishDAO.selectWishCount(userId, isbn13);
		
		return count != 0;
	}
	
	
}
