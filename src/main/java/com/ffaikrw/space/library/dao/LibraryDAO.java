package com.ffaikrw.space.library.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ffaikrw.space.library.model.Library;

@Repository
public interface LibraryDAO {
	
	
	// 내 서재에 담기
	public int insertLibrary(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
	
	// 내 서재에서 삭제
	public int deleteLibrary(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
	
	// 내 서재의 모든 도서 가져오기
	public List<Library> selectLibrary(@Param("userId") int userId);
	
	
	// 완독 날짜 수정
	public int updateReadDate(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			, @Param("readDate") String readDate
			);
	
	
	// 내 서재에 있는 도서인지 확인
	public int selectLibraryCountByIsbn(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
	
	// 내 서재에 도서 존재 여부 확인
	public int selectLibraryCountByUserId(@Param("userId") int userId);
	
	 
	// 회원탈퇴 - 내 서재의 모든 도서 삭제
	public int deleteAllLibrary(@Param("userId") int userId);
	
}
