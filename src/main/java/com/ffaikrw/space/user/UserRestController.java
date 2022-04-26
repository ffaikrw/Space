package com.ffaikrw.space.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ffaikrw.space.user.bo.UserBO;
import com.ffaikrw.space.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	
	// 회원가입 API
	@PostMapping("signup_api")
	public Map<String, String> signUp(
			@RequestParam("nickname") String nickname,
			@RequestParam("email") String email,
			@RequestParam("password") String password
			) {
		
		int count = userBO.addUser(nickname, email, password);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	// 닉네임 중복확인 API
	@GetMapping("/duplicate_nickname")
	public Map<String, Boolean> nicknameIsDuplicate(
			@RequestParam("nickname") String nickname
			) {
		
		boolean isDuplicate = userBO.nicknameIsDuplicate(nickname);
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("is_duplicate", isDuplicate);
		
		return resultMap;
	}
	
	
	// 이메일 중복확인 API
	@GetMapping("/duplicate_email")
	public Map<String, Boolean> emailIsDuplicate(@RequestParam("email") String email) {
		
		boolean isDuplicate = userBO.emailIsDuplicate(email);
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("is_duplicate", isDuplicate);
		
		return resultMap;
	}
	
	
	// 로그인 API
	@PostMapping("/signin_api")
	public Map<String, String> signIn(
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpServletRequest request
			) {
		
		User user = userBO.getUser(email, password);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (user != null) {
			resultMap.put("result", "success");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userNickname", user.getNickname());
			session.setAttribute("userProfileImg", user.getProfileImage());
			
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	// 프로필 관리 API
	@PostMapping("/manage_profile")
	public Map<String, String> manageProfile(
			@RequestParam("nickname") String nickname
			, @RequestParam("file") MultipartFile file
			, HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = userBO.editProfile(userId, nickname, file);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	
	

}
