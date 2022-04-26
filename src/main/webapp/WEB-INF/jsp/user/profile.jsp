<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 관리</title>

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
	
	<div id="wrap">
		<div class="contents d-flex">
		
			<c:import url="/WEB-INF/jsp/include/nav.jsp" />
			
			<div class="content">
			
				<div class="content-header d-flex justify-content-between align-items-center">
					<div class="page-name">프로필 관리</div>
					<div>
						<button type="button" id="editProfileBtn" class="profile-update-btn">수정</button>
					</div>
				</div>
				
				<div class="content-section d-flex">
				
					<div class="profile-image-box d-flex justify-content-center align-items-center">
						<div>
							<div class="user-icon-radius">
								<div class="user-icon">
									<i class="bi bi-person-fill"></i>
								</div>
							</div>
							<div class="edit-profile-image">
								<a href="#" id="editImage"><i class="bi bi-image-fill"></i> 프로필 사진 수정</a>
								<input type="file" id="fileInput" class="d-none">
							</div>
						</div>	
					</div>
					<div class="profile-nickname-box d-flex justify-content-center align-items-center">
						<div>
							<div class="nickname-edit-label">닉네임 수정</div>
							<input type="text" id="editNickname" class="nickname-edit-input" placeholder="${ userNickname }">
							<span id="availableNicknameIcon" class="validation-icon text-success d-none"><i class="bi bi-check"></i></span>
							<span id="duplicateNicknameIcon" class="validation-icon text-danger d-none"><i class="bi bi-x"></i></span>
							<div id="duplicateNicknameText" class="validation-text text-danger d-none mr-5">사용 중인 닉네임입니다.</div>
						</div>	
					</div>
				
				</div>
				
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
				
			</div>
			
		</div>
	</div>
	
	<c:import url="/WEB-INF/jsp/include/profileModal.jsp" />
	
	
	
	<script>
	
		$(document).ready(function(){
			
			// 닉네임 중복 여부 저장 변수
			var nicknameIsDuplicate = true;
			
			// 수정한 닉네임 중복 확인
			$("#editNickname").focusout(function(){
				
				let nickname = $("#editNickname").val().trim();
				
				if (nickname == "") {
					// 입력란이 비어있으면 기존 닉네임으로 저장
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
				
				// 닉네임 중복확인 초기화
				$("#nickname").on("input", function(){
					
					nicknameIsDuplicate = true;
					
					$("#availableNicknameIcon").addClass("d-none");
					$("#duplicateNicknameIcon").addClass("d-none");
					$("#duplicateNicknameText").addClass("d-none");
					
				});
				
				
			});
			
			
			
			$("#editProfileBtn").on("click", function(){
				
				let nickname = $("#editNickname").val().trim();
				
				
				
				
				// 이미지 파일 업로드
				
			});
			
			
			
			$("#editImage").on("click", function(){
				
				$("#fileInput").click();
				
			});
			
		});
	
	
	</script>
	
	
</body>
</html>