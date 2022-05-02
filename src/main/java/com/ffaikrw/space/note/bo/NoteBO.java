package com.ffaikrw.space.note.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffaikrw.space.aladinAPI.bo.AladinApiBO;
import com.ffaikrw.space.aladinAPI.model.AladinItem;
import com.ffaikrw.space.aladinAPI.model.AladinResponse;
import com.ffaikrw.space.note.dao.NoteDAO;
import com.ffaikrw.space.note.model.Note;
import com.ffaikrw.space.note.model.Notelist;

@Service
public class NoteBO {
	
	@Autowired
	private NoteDAO noteDAO;
	
	@Autowired
	private AladinApiBO aladinApiBO;
	
	
	
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
	
	
	// 독서노트 모아보기
	public List<Notelist> getNotelist(int userId) {
		
		List<Notelist> notelistList = new ArrayList<>();
		
		List<Note> getNotelist = noteDAO.selectNoteByUserId(userId);
		
		String coverSize = "Small";
		
		for (Note note : getNotelist) {
			
			AladinResponse aladinResponse = aladinApiBO.getItemLookUp(note.getIsbn(), coverSize);
			List<AladinItem> aladinItem = aladinResponse.getItem();
			
			if (aladinItem == null) {
				continue;
			}
			
			Notelist notelist = new Notelist();
			
			String content = note.getContent();
			String tagRemoveContent = content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
			
			String noteContent = "";
			
			if (tagRemoveContent.length() > 100) {
				noteContent = tagRemoveContent.substring(0, 99);
			} else {
				noteContent = tagRemoveContent;
			}
			
			notelist.setCover(aladinItem.get(0).getCover());
			notelist.setTitle(aladinItem.get(0).getTitle());
			notelist.setIsbn(note.getIsbn());
			notelist.setContent(noteContent);
			notelist.setCreatedAt(note.getCreatedAt());
			notelist.setUpdatedAt(note.getUpdatedAt());
			
			notelistList.add(notelist);
		}
		
		return notelistList;
	}
	
	
	// 독서노트 존재 여부 확인
	public boolean noteIsExist(int userId) {
		
		int count = noteDAO.selectNoteCountByUserId(userId);
		
		return !(count == 0);
	}
	
	
	// 회원탈퇴 - 모든 독서노트 삭제
	public int deleteAllNote(int userId) {
		return noteDAO.deleteAllNote(userId);
	}
	
	
}
