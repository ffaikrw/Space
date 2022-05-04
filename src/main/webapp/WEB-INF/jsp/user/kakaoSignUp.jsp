<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 회원가입</title>

	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- bootstrap CDN link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<!-- stylesheet -->
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>

	<div id="wrap" class="d-flex">
		
		<div class="signBox-background">
			<img src="/static/images/reading_image.jpg">
		</div>
		<div class="signBox-content d-flex justify-content-center">
			<div class="sign-box">
				<div class="signBox-logo text-center mt-5">
					space
				</div>
				<div class="signBox-text1">
					이 도서관에 들어오면 <br>
					내가 왜 여기서 나가는지 이해할 수가 없다.
				</div>
				<div class="signBox-text2">
					마리 드 세비네 Marie de Sevigne
				</div>
				
				<div class="social-sign-label  mt-4">닉네임</div>
				<input type="text" id="nickname" class="sign-input">
				<span id="availableNicknameIcon" class="validation-icon text-success d-none"><i class="bi bi-check"></i></span>
				<span id="duplicateNicknameIcon" class="validation-icon text-danger d-none"><i class="bi bi-x"></i></span>
				<div id="duplicateNicknameText" class="validation-text text-danger d-none">사용 중인 닉네임입니다.</div>
				
				<div class="social-sign-label mt-3">카카오 이메일</div>
				<input type="text" id="email" class="sign-input" data-kakao-id="${ kakaoUserInfo.id }" value="${ kakaoUserInfo.kakao_account.email }" >
				
				<button id="joinBtn" class="sign-btn mt-3">회원가입</button>
				
				<div class="sign-link-box mt-3 text-center">
					<a href="/user/sign_in" id="loginLink" class="sign-link">로그인</a>
				</div>
				
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
			</div>
		</div>	
	
	</div>
	
	
	<script>
	
		$(document).ready(function(){
			
			// 닉네임 중복 여부 저장 변수
			var nicknameIsDuplicate = true;
			
			
		});
	
	</script>

</body>
</html>