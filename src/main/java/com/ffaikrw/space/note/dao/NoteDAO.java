package com.ffaikrw.space.note.dao;

import java.util.List;

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
	
	
	// 독서노트 삭제
	public int deleteNote(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
	
	// 독서노트 수정
	public int updateNote(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			, @Param("content") String content
			);
	
	
	// 독서노트 보기
	public Note selectNote(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
	
	// 독서노트 작성 여부 확인
	public int selectNoteCount(
			@Param("userId") int userId
			, @Param("isbn") String isbn13
			);
	
	
	// 독서노트 모아보기
	public List<Note> selectNoteByUserId(@Param("userId") int userId);
	
	
	// 독서노트 존재 여부 확인
	public int selectNoteCountByUserId(@Param("userId") int userId);
	
	
	// 회원탈퇴 - 모든 독서노트 삭제
	public int deleteAllNote(@Param("userId") int userId);
	
}
