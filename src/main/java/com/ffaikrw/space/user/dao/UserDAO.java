package com.ffaikrw.space.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ffaikrw.space.user.model.User;

@Repository
public interface UserDAO {
	
	
	// 회원가입 API
	public int insertUser(
			@Param("nickname") String nickname,
			@Param("email") String email,
			@Param("password") String password
			);
	
	
	// 닉네임 중복확인 API
	public int selectNicknameCount(@Param("nickname") String nickname);
	
	
	// 이메일 중복확인 API
	public int selectEmailCount(@Param("email") String email);
	
	
	// 로그인 API
	public User selectUser(
			@Param("email") String email,
			@Param("password") String password
			);
		
		
}
