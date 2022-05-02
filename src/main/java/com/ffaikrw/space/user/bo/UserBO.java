package com.ffaikrw.space.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ffaikrw.space.bookDetail.review.bo.ReviewBO;
import com.ffaikrw.space.common.EncryptUtils;
import com.ffaikrw.space.common.FileManagerService;
import com.ffaikrw.space.library.bo.LibraryBO;
import com.ffaikrw.space.note.bo.NoteBO;
import com.ffaikrw.space.user.dao.UserDAO;
import com.ffaikrw.space.user.model.User;
import com.ffaikrw.space.wish.bo.WishBO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private LibraryBO libraryBO;
	
	@Autowired
	private NoteBO noteBO;
	
	@Autowired
	private WishBO wishBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	
	// 회원가입 API
	public int addUser(
			String nickname,
			String email,
			String password
			) {
	
		String encryptPassword = EncryptUtils.md5(password);
		
		if (encryptPassword == null || encryptPassword.equals("")) {
			return 0;
		}
		
		String profileImage = "/static/images/user_1.png";
		
		return userDAO.insertUser(nickname, email, encryptPassword, profileImage);
	}
	
	
	// 닉네임 중복확인 API
	public boolean nicknameIsDuplicate(String nickname) {
		
		int count = userDAO.selectNicknameCount(nickname);;
		
		return !(count == 0);
	}
	
	
	// 이메일 중복확인 API
	public boolean emailIsDuplicate(String email) {
		
		int count = userDAO.selectEmailCount(email);
		
		return !(count == 0);
	}
	
	
	// 로그인
	public User getUser(String email, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(email, encryptPassword);
		
	}
	
	
	// 프로필 수정
	public int editProfile(int userId, String nickname, MultipartFile file) {
		
		String profileImage = null;
		
		// 파일이 비어 있으면 닉네임만 업데이트 하는 DAO로 리턴
		// 그렇지 않으면 return userDAO.updateProfile(userId, nickname, profileImage);
		
		if(file != null) {
			profileImage = FileManagerService.saveFile(userId, file);
			return userDAO.updateProfile(userId, nickname, profileImage);
		} else {
			return userDAO.updateProfileNickname(userId, nickname);
		}
		
	}
	
	
	// 프로필 정보 가져오기
	public User getProfile(int userId) {
		return userDAO.selectProfile(userId);
	}
	
	
	// 회원탈퇴
	public boolean userWithdrawal(int userId) {
		
		boolean isAllDeleted = true;
		
		// user 테이블 삭제
		int userDeleteCount = userDAO.deleteUser(userId);
		if (userDeleteCount == 0) {
			isAllDeleted = false;
		}
		
		// library 테이블 삭제
		// 내 서재에 도서가 0이면 delete 진행하지 않고 넘어감 아니면 삭제
		if (libraryBO.libraryIsExist(userId)) {
			
			libraryBO.deleteAllLibrary(userId);
			
			if (libraryBO.deleteAllLibrary(userId) == 0) {
				isAllDeleted = false;
			}
			
		} else {
			isAllDeleted = true;
		}
		
		
		// note 테이블 삭제
		if(noteBO.noteIsExist(userId)) {
			
			noteBO.deleteAllNote(userId);
			
			if (noteBO.deleteAllNote(userId) == 0) {
				isAllDeleted = false;
			}
			
		} else {
			isAllDeleted = true;
		}
		
		// wish 테이블 삭제
		if (wishBO.wishIsExist(userId)) {
			
			wishBO.deleteAllWish(userId);
			
			if (wishBO.deleteAllWish(userId) == 0) {
				isAllDeleted = false;
			}
			
		} else {
			isAllDeleted = true;
		}
		
		// review 테이블 삭제
		if (reviewBO.reviewIsExist(userId)) {
			
			reviewBO.deleteAllReview(userId);
			
			if (reviewBO.deleteAllReview(userId) == 0) {
				isAllDeleted = false;
			}
			
		} else {
			isAllDeleted = true;
		}
		
		return isAllDeleted;
	}
	
	
}
