package com.ffaikrw.space.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	
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
	
}
