package com.ffaikrw.space.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ffaikrw.space.kakao.model.KakaoUserResponse;
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
	
	// 카카오 회원가입 화면
	@GetMapping("/oauth/kakaoLogin")
	public String getOauthCode(
			@RequestParam(value = "code", required = false) String code
			, Model model
			, HttpServletRequest request
			) {
		
		KakaoUserResponse kakaoUserInfo = userBO.getKakaoUserInfo(code);
		
		// 1. 사용자 정보 조회
		// 2. 이미 회원일 경우 바로 세션에 값 저장하여 홈 화면으로 이동
		// 3. 회원이 아닐 경우 회원가입 진행
		// 3-1. 이메일이 없을 경우 카카오 로그인이 아닌 일반 회원가입 화면으로 이동
		
		User user = new User();
		
		if (userBO.emailIsDuplicate(kakaoUserInfo.getKakao_account().getEmail())) { // 이미 있는 사용자
			
			user = userBO.getKakaoUser(kakaoUserInfo.getKakao_account().getEmail());
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userNickname", user.getNickname());
			session.setAttribute("userProfileImg", user.getProfileImage());
			
			return "redirect:/browse/home";
			
		} else { // 처음 가입하는 사용자
			
			if (kakaoUserInfo.getKakao_account().getEmail() != null) { // 이메일 있는 경우
				
				// DB에 사용자 회원번호, 이메일, 프로필 사진 저장
				String nickname = Long.toString(kakaoUserInfo.getId());
				String email = kakaoUserInfo.getKakao_account().getEmail();
				String profileImage = kakaoUserInfo.getKakao_account().getProfile().getProfile_image_url();
				
				int count = userBO.saveKakaoUser(nickname, email, profileImage);
				
				if (count == 1) {
					
					user = userBO.getKakaoUser(email);
					
					HttpSession session = request.getSession();
					
					session.setAttribute("userId", user.getId());
					session.setAttribute("userNickname", user.getNickname());
					session.setAttribute("userProfileImg", user.getProfileImage());
					
					return "redirect:/browse/home";
					
				} else {
					
					return "redirect:/user/sign_up";
					
				}
				
			} else { // 이메일 없는 경우
				
				return "redirect:/user/sign_up";
				
			}
			
		}
		
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
		
		session.removeAttribute("userNickname");
		session.removeAttribute("userProfileImg");
		
		session.setAttribute("userNickname", user.getNickname());
		session.setAttribute("userProfileImg", user.getProfileImage());
		
		return "user/profile";
	}
	
}
