package com.ffaikrw.space.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ffaikrw.space.user.bo.UserBO;
import com.ffaikrw.space.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserBO userBO;
	
	
	
	// 시작 화면
	@GetMapping("/start")
	public String startView() {
		return "user/startPage";
	}
	
	
	// 회원가입 화면
	@GetMapping("/sign_up")
	public String signUpView() {
		return "user/signUp";
	}
	
	
	// 로그인 화면
	@GetMapping("/sign_in")
	public String signInView() {
		return "user/signIn";
	}
	
	
	// 로그아웃
	@GetMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userNickname");
		session.removeAttribute("userProfileImg");
		
		return "redirect:/user/sign_in";
		
	}
	
	
	// 프로필 관리
	@GetMapping("/profile")
	public String manageProfileView(
			HttpServletRequest request
			, Model model
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		User user = userBO.getProfile(userId);
		model.addAttribute("userInfo", user);
		
		return "user/profile";
	}
	
}
