<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>space 회원가입</title>

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
				<input type="text" id="nickname" class="sign-input mt-4" placeholder="닉네임">
				<span id="availableNicknameIcon" class="validation-icon text-success d-none"><i class="bi bi-check"></i></span>
				<span id="duplicateNicknameIcon" class="validation-icon text-danger d-none"><i class="bi bi-x"></i></span>
				<div id="duplicateNicknameText" class="validation-text text-danger d-none">사용 중인 닉네임입니다.</div>
				
				<input type="text" id="email" class="sign-input mt-3" placeholder="이메일 (example@gmail.com)">
				<span id="availableEmailIcon" class="validation-icon text-success d-none"><i class="bi bi-check"></i></span>
				<span id="duplicateEmailIcon" class="validation-icon text-danger d-none"><i class="bi bi-x"></i></span>
				<div id="duplicateEmailText" class="validation-text text-danger d-none">중복된 이메일입니다.</div>
				
				<input type="password" id="password" class="sign-input mt-3" placeholder="비밀번호">
				
				<input type="password" id="passwordConfirm" class="sign-input mt-3" placeholder="비밀번호 확인">
				<span id="matchIcon" class="validation-icon text-success d-none"><i class="bi bi-check"></i></span>
				<span id="notMatchIcon" class="validation-icon text-danger d-none"><i class="bi bi-x"></i></span>
				<div id="notMatchText" class="validation-text text-danger d-none">비밀번호가 일치하지 않습니다.</div>
				
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
			
			// 이메일 중복 여부 저장 변수
			var emailIsDuplicate = true;
			
			// 비밀번호 일치 여부 저장 변수
			var notMatch = true;
			
			
			// 닉네임 중복 확인
			$("#nickname").focusout(function(){
				
				let nickname = $("#nickname").val().trim();
				
				if (nickname == "") {
					return;
				}

				$.ajax({
					
					type:"get"
					, url:"/user/duplicate_nickname"
					, data:{"nickname":nickname}
					, success:function(data){
						
						$("#availableNicknameIcon").addClass("d-none");
						$("#duplicateNicknameIcon").addClass("d-none");
						$("#duplicateNicknameText").addClass("d-none");
						
						if(data.is_duplicate) {
							$("#duplicateNicknameIcon").removeClass("d-none");
							$("#duplicateNicknameText").removeClass("d-none");
						} else {
							$("#availableNicknameIcon").removeClass("d-none");
						}
						
						nicknameIsDuplicate = data.is_duplicate;
						
					}
					, error:function(){
						alert("닉네임 중복확인 통신 에러");
					}
					
				});
				
			});
			
			
			// 닉네임 중복확인 초기화
			$("#nickname").on("input", function(){
				
				nicknameIsDuplicate = true;
				
				$("#availableNicknameIcon").addClass("d-none");
				$("#duplicateNicknameIcon").addClass("d-none");
				$("#duplicateNicknameText").addClass("d-none");
				
			});
			
			
			
			// 이메일 중복 확인
			$("#email").focusout(function(){
				
				let email = $("#email").val().trim();
				
				if (email == "") {
					return;
				}

				$.ajax({
					
					type:"get"
					, url:"/user/duplicate_email"
					, data:{"email":email}
					, success:function(data){
						
						$("#availableEmailIcon").addClass("d-none");
						$("#duplicateEmailIcon").addClass("d-none");
						$("#duplicateEmailText").addClass("d-none");
						
						if(data.is_duplicate) {
							$("#duplicateEmailIcon").removeClass("d-none");
							$("#duplicateEmailText").removeClass("d-none");
						} else {
							$("#availableEmailIcon").removeClass("d-none");
						}
						
						emailIsDuplicate = data.is_duplicate;
						
					}
					, error:function(){
						alert("이메일 중복확인 통신 에러");
					}
					
				});
				
			});
			
			
			// 이메일 중복확인 초기화
			$("#email").on("input", function(){
				
				emailIsDuplicate = true;
				
				$("#availableEmailIcon").addClass("d-none");
				$("#duplicateEmailIcon").addClass("d-none");
				$("#duplicateEmailText").addClass("d-none");
				
			});
			
			
			
			
			// 비밀번호 일치 여부 확인
			$("#passwordConfirm").focusout(function(){
				
				let password = $("#password").val().trim();
				let passwordConfirm = $("#passwordConfirm").val().trim();
				
				if (password == "") {
					return;
				}
				
				$("#matchIcon").addClass("d-none");
				$("#notMatchIcon").addClass("d-none");
				$("#notMatchText").addClass("d-none");
				
				if (password == passwordConfirm) {
					notMatch = false;
					$("#matchIcon").removeClass("d-none");
				} else {
					notMatch = true;
					$("#notMatchIcon").removeClass("d-none");
					$("#notMatchText").removeClass("d-none");
				}
				
			});
			
			
			// 비밀번호 일치 여부 초기화
			$("#passwordConfirm").on("input", function(){
				
				notMatch = true;
				
				$("#matchIcon").addClass("d-none");
				$("#notMatchIcon").addClass("d-none");
				$("#notMatchText").addClass("d-none");
				
			});
			
			
			
			
			// 회원가입 버튼
			$("#joinBtn").on("click", function(){
				
				let nickname = $("#nickname").val().trim();
				let email = $("#email").val().trim();
				let password = $("#password").val().trim();
				let passwordConfirm = $("#passwordConfirm").val().trim();
				
				// 유효성 확인
				if (nickname == "") {
					alert("사용할 닉네임을 입력하세요.");
					return;
				}
				
				if (nicknameIsDuplicate) {
					return;
				}
				
				if (email == "") {
					alert("이메일을 입력하세요.");
					return;
				}
				
				if (emailIsDuplicate) {
					return;
				}
				
				
				if (password == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				if (notMatch) {
					$("#notMatchIcon").removeClass("d-none");
					$("#notMatchText").removeClass("d-none");
					return;
				}
				
				
				$.ajax({
					
					type:"post",
					url:"/user/signup_api",
					data:{"nickname":nickname, "email":email, "password":password},
					success: function(data){
						
						if(data.result == "success") {
							alert("회원가입이 완료되었습니다. 로그인을 진행해주세요.");
							location.href="/user/sign_in";
						} else {
							alert("회원가입을 다시 진행해주세요.");
						}
						
					},
					error: function(){
						alert("회원가입 통신 에러");
					}
					
				});
				
			});
			
		});
	
	
	</script>
	
	

</body>
</html>