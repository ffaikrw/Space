package com.ffaikrw.space.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ffaikrw.space.kakao.bo.KakaoBO;
import com.ffaikrw.space.kakao.model.KakaoTokenResponse;
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
		
		KakaoUserResponse responseUserInfo = userBO.getKakaoUserInfo(code);
		
		// 이메일이 있을 경우 정보를 세션과 DB에 저장하고 홈 화면으로 이동
		if (responseUserInfo.getKakao_account().getEmail() != null) {
			// DB에 저장
			String nickname = Long.toString(responseUserInfo.getId());
			String email = responseUserInfo.getKakao_account().getEmail();
			String kakaoProfileImg = responseUserInfo.getKakao_account().getProfile().getProfile_image_url();
			String profileImage = null;
			if (responseUserInfo.getKakao_account().getProfile().isIs_default_image()) {
				profileImage = "/static/images/user_1.png";
			} else {
				profileImage = kakaoProfileImg;
			}
			
			int count = userBO.saveKakaoUser(nickname, email, profileImage);
			
			if (count == 1) {
				
				User user = userBO.getKakaoUser(email);
				
				HttpSession session = request.getSession();
				
				session.setAttribute("userId", user.getId());
				session.setAttribute("userNickname", user.getNickname());
				session.setAttribute("userProfileImg", user.getProfileImage());
				
				return "redirect:/browse/home";
				
			} else {
				return "redirect:/user/sign_up";
			}
			
			
			
			
		} else {
			model.addAttribute("kakaoUserInfo", responseUserInfo);
			return "user/kakaoSignUp";
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
