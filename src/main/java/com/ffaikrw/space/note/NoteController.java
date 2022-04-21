package com.ffaikrw.space.note;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ffaikrw.space.note.bo.NoteBO;
import com.ffaikrw.space.note.model.Note;

@Controller
@RequestMapping("/library")
public class NoteController {
	
	@Autowired
	private NoteBO noteBO;
	
	
	// 독서 노트 작성
	@GetMapping("/create_note")
	public String createNoteView(@RequestParam("isbn13") String isbn13) {
		return "library/createNote";
	}
	
	
	// 독서노트 보기
	@GetMapping("/note_view")
	public String viewNote(
			@RequestParam("isbn13") String isbn13
			, HttpServletRequest request
			, Model model
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Note note = noteBO.getNote(userId, isbn13);
		
		model.addAttribute("note", note);
		
		return "library/noteView";
	}
	
	
	// 독서노트 수정
	@GetMapping("/edit_note")
	public String editNoteView() {
		return "library/editNote";
	}
	
	
}
