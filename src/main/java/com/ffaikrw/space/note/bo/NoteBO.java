package com.ffaikrw.space.note.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.note.dao.NoteDAO;
import com.ffaikrw.space.note.model.Note;

@Service
public class NoteBO {
	
	@Autowired
	private NoteDAO noteDAO;
	
	
	// 독서노트 작성
	public int createNote(int userId, String isbn13, String content) {
		return noteDAO.insertNote(userId, isbn13, content);
	}
	
	
	// 독서노트 삭제
	public int deleteNote(int userId, String isbn13) {
		return noteDAO.deleteNote(userId, isbn13);
	}
	
	
	// 독서노트 수정
	public int updateNote(int userId, String isbn13, String content) {
		return noteDAO.updateNote(userId, isbn13, content);
	}
	
	
	// 독서노트 보기
	public Note getNote(int userId, String isbn13) {
		return noteDAO.selectNote(userId, isbn13);
	}
	
	
	// 독서노트 작성 여부 확인
	public boolean noteIsDuplicate(int userId, String isbn13) {
		
		int count = noteDAO.selectNoteCount(userId, isbn13);
		
		return (count != 0);
	}
	
	
	
	
}
