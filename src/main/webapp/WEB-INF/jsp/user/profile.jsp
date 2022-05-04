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
					<div class="d-flex justify-content-center">
						<button type="button" data-toggle="modal" data-target="#withdrawalModalCenter" class="withdrawal-btn">회원탈퇴</button>
					</div>
				</div>
				
				<div class="content-section d-flex">
				
					<div class="profile-image-box d-flex justify-content-center align-items-center">
						<div>
							<div class="profile-image-border">
								<img src="${ userInfo.profileImage }" id="imgPreview" class="profile-image">
							</div>
							<div class="edit-profile-image">
								<a href="#" id="editImage"><i class="bi bi-image-fill"></i> 프로필 사진 선택</a>
								<input type="file" id="fileInput" class="d-none">
							</div>
						</div>	
					</div>
					<div class="profile-nickname-box d-flex align-items-center">
						<div>
							<div class="d-flex align-items-center mb-1">
								<div class="nickname-edit-label">닉네임 수정</div>
							</div>	
							<input type="text" id="editNickname" data-value="${ userInfo.nickname }" class="nickname-edit-input" placeholder="${ userInfo.nickname }">
							<span id="availableNicknameIcon" class="validation-icon text-success d-none"><i class="bi bi-check"></i></span>
							<span id="duplicateNicknameIcon" class="validation-icon text-danger d-none"><i class="bi bi-x"></i></span>
							<div id="duplicateNicknameText" class="validation-text text-danger d-none mr-5">사용 중인 닉네임입니다.</div>
						</div>	
					</div>
					<div class="withdrawal-box d-flex align-items-end">
						<button type="button" id="editProfileBtn" class="profile-update-btn">수정</button>
					</div>
				
				</div>
				
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
				
			</div>
			
		</div>
	</div>
	
	<!-- 프로필 Modal -->
	<c:import url="/WEB-INF/jsp/include/profileModal.jsp" />
	
	
	<!-- 회원탈퇴 Modal -->
	<div class="modal fade" id="withdrawalModalCenter" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
		    	<div class="modal-body withdrawal-modal-body d-flex justify-content-center align-items-center">
		    		<div class="text-center">
			    		<div class="mt-3">회원탈퇴 시 개인정보, 내 서재, 독서노트, 읽어볼까, 한 줄 평의<br>모든 정보가 삭제됩니다.</div>
			    		<div class="mt-3">space를 탈퇴하시겠습니까?</div>
		    		</div>
		    	</div>
				<div class="modal-footer withdrawal-modal-footer d-flex justify-content-between">
					<button type="button" id="withdrawalClose" data-dismiss="modal">취소</button>
					<button type="button" id="withdrawalModal">탈퇴</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<script>
	
		$(document).ready(function(){
			
			// 닉네임 중복 여부 저장 변수
			var nicknameIsDuplicate = true;
			
			// 수정한 닉네임 중복 확인
			$("#editNickname").focusout(function(){
				
				let nickname = $("#editNickname").val().trim();
				
				if (nickname == "") {
					// 입력란이 비어있으면 기존 닉네임으로 저장
					nickname = $("#editNickname").data("value");
				}
				
				$.ajax({
					
					type:"get"
					, url:"/user/duplicate_nickname"
					, data:{"nickname":nickname}
					, success:function(data){
						
						$("#availableNicknameIcon").addClass("d-none");
						$("#duplicateNicknameIcon").addClass("d-none");
						$("#duplicateNicknameText").addClass("d-none");
						
						// 세션에 저장된 값과 같은 이름이면 false
						// 아니면 중복검사 실행
						
						if (nickname == $("#editNickname").data("value")) {
							$("#availableNicknameIcon").removeClass("d-none");
							nicknameIsDuplicate = false;
						} else if (data.is_duplicate) {
							$("#duplicateNicknameIcon").removeClass("d-none");
							$("#duplicateNicknameText").removeClass("d-none");
							nicknameIsDuplicate = data.is_duplicate;
						} else {
							$("#availableNicknameIcon").removeClass("d-none");
							nicknameIsDuplicate = data.is_duplicate;
						}
						
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
			
			
			// 프로필 수정 버튼
			$("#editProfileBtn").on("click", function(){
				
				let nickname = $("#editNickname").val().trim();
				
				// 입력란이 비어있으면 기존 닉네임으로 저장
				if (nickname == "") {
					nickname = $("#editNickname").data("value");
					nicknameIsDuplicate = false;
				}
				
				if (nicknameIsDuplicate) {
					alert("사용할 수 없는 닉네임입니다.");
					return;
				}
				
				// 이미지 파일 업로드
				let formData = new FormData();
				formData.append("nickname", nickname);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					
					type:"post"
					, url:"/user/manage_profile"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data){
						
						if (data.result == "success") {
							alert("프로필이 수정되었습니다.");
							location.href="/user/profile";
						} else {
							alert("프로필을 수정하지 못했습니다.");
						}
					}
					, error:function(){
						alert("프로필 수정 통신 에러");
					}
					
				});
				
			});
			
			
			// 이미지 파일 미리보기
			$("#fileInput").on("change", function(event){
				
				var file = event.target.files[0];
				
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#imgPreview").attr("src", e.target.result);
				}
				
				reader.readAsDataURL(file);
				
			});
			
			
			$("#editImage").on("click", function(){
				
				$("#fileInput").click();
				
			});
			
			
			
			// 회원탈퇴 버튼
			$("#withdrawalModal").on("click", function(){
				
				$.ajax({
					
					type: "get"
					, url: "/user/withdrawal"
					, success: function(data){
						
						if (data.result == "success") {
							alert("회원탈퇴가 정상적으로 완료되었습니다.");
							location.href = "/user/start";
						} else {
							alert("회원탈퇴를 다시 시도해주세요.");
						}
						
					}
					, error: function(){
						alert("회원탈퇴 통신에러");
					}
					
				});
				
			});
			
			
		});
		
	</script>
	
	
</body>
</html>