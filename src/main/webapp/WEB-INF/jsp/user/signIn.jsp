<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- bootstrap CDN link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- stylesheet -->
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>

	<div id="wrap" class="d-flex">
		
		<div class="signBox-background">
			<img src="/static/images/reading_image.jpg">
		</div>
		<div class="signBox-content d-flex justify-content-center">
			<div class="sign-box mt-3">
				<div class="signBox-logo text-center mt-5">
					space
				</div>
				<div class="signBox-text1">
					진정한 책을 만났을 때는 틀림이 없다. <br>
					그것은 사랑에 빠지는 것과도 같다. 
				</div>
				<div class="signBox-text2">
					크리스토퍼 몰리 Christopher Morley
				</div>

				<form id="loginForm">
					<input type="text" id="email" class="sign-input mt-3" placeholder="이메일 (example@gmail.com)">
					<input type="password" id="password" class="sign-input mt-3" placeholder="비밀번호">
					
					<button type="submit" id="logininBtn" class="sign-btn mt-3">로그인</button>
				</form>
				
				<div class="social-login-box mt-3 d-flex align-items-center justify-content-center">
					<a href="#" id="kakaoLoginLink" class="login-link">
						<img src="/static/images/kakao_login_large_wide.png" class="social-login-img">
					</a>
				</div>
				
				<div class="sign-link-box mt-5 mb-5 text-center">
					<a href="/user/sign_up" id="joinLink" class="sign-link">회원가입하러 가기</a>
				</div>
				
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
			</div>
		</div>
	
	</div>
	
	
	<script>
	
		$(document).ready(function(){
			
			// 카카오 로그인
			$("#kakaoLoginLink").on("click", function(){
				
				$.ajax({
					
					type: "get"
					, url: "/kakao/login"
					, success: function(data) {
						location.href = data;
					}
					, error: function() {
						alert("카카오톡 로그인 통신 오류");
					}
					
				});
				
			});
			
			
			$("#loginForm").on("submit", function(e){
				
				e.preventDefault();
				
				let email = $("#email").val().trim();
				let password = $("#password").val().trim();
				
				// 유효성 검사
				if (email == "") {
					alert("이메일을 입력하세요.");
					return;
				}
				
				if (password == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				$.ajax({
					
					type:"post"
					, url:"/user/signin_api"
					, data:{"email":email, "password":password}
					, success:function(data){
						
						if (data.result == "success") {
							location.href="/browse/home";
						} else {
							alert("입력하신 회원정보를 찾을 수 없습니다.");
						}
						
					}
					, error:function(){
						alert("로그인 통신 에러");
					}
					
				});
			
			});
			
		});
	
	</script>
	


</body>
</html>