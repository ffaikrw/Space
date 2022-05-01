package com.ffaikrw.space.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			) throws IOException {
		
		String uri = request.getRequestURI();
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		if (userId == null) {
			
			// 작가 화면
			if (uri.startsWith("/author")) {
				response.sendRedirect("/user/start");
				return false;
			}
			
			// 홈, 신작, 베스트셀러, 편집자추천, 검색, 검색 결과 화면
			if (uri.startsWith("/browse")) {
				response.sendRedirect("/user/start");
				return false;
			}
			
			// 내 서재, 독서노트 작성, 수정, 보기, 모아보기, 독서 캘린더 화면
			if (uri.startsWith("/library")) {
				response.sendRedirect("/user/start");
				return false;
			}
			
			// 프로필 관리 화면
			if (uri.startsWith("/user/profile")) {
				response.sendRedirect("/user/start");
				return false;
			}
			
			// 읽어볼까 화면
			if (uri.startsWith("/wishlist")) {
				response.sendRedirect("/user/start");
				return false;
			}
			
		} else {
			
			if (uri.startsWith("/user/sign_in")) {
				response.sendRedirect("/browse/home");
				return false;
			}
			
			if (uri.startsWith("/user/sign_up")) {
				response.sendRedirect("/browse/home");
				return false;
			}
			
			if (uri.startsWith("/user/start")) {
				response.sendRedirect("/browse/home");
				return false;
			}
			
		}
		
		return true;
	}
	
	
	@Override
	public void postHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, ModelAndView modelAndView
			) {
		
	}
	
	
	@Override
	public void afterCompletion(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, Exception ex
			) {
		
	}
	
	
}
