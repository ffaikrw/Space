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
			@Param("password") String password,
			@Param("profileImage") String profileImage
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
	
	
	// 프로필 관리 - 닉네임, 프로필사진 모두 수정
	public int updateProfile(
			@Param("id") int userId
			, @Param("nickname") String nickname
			, @Param("profileImage") String profileImage
			);
	
	// 프로필 관리 - 닉네임만 수정
	public int updateProfileNickname(
			@Param("id") int userId
			, @Param("nickname") String nickname
			);
		
	
	// 프로필 정보 가져오기
	public User selectProfile(@Param("id") int userId);
	
	
	// 회원탈퇴
	public int deleteUser(@Param("id") int userId);
		
}
