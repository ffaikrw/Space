package com.ffaikrw.space.note.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ffaikrw.space.note.model.Note;

@Repository
public interface NoteDAO {
	
	// 독서노트 작성
	public int insertNote(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			, @Param("content") String content
			);
	
	
	// 독서노트 보기
	public Note selectNote(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
}
