package com.ffaikrw.space.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ffaikrw.space.common.EncryptUtils;
import com.ffaikrw.space.common.FileManagerService;
import com.ffaikrw.space.user.dao.UserDAO;
import com.ffaikrw.space.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	
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
		
		return userDAO.insertUser(nickname, email, encryptPassword);
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
		
		String profileImage = FileManagerService.saveFile(userId, file);
		
		return userDAO.updateProfile(userId, nickname, profileImage);
	}
	
	
	// 프로필 정보 가져오기
	public User getProfile(int userId) {
		return userDAO.selectProfile(userId);
	}
	
}
