<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서노트 보기</title>

	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- bootstrap CDN link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	
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
					<div class="page-name">독서노트 보기</div>
					
					<div OnClick="location.href='/library/notelist'" style="cursor:pointer;" class="go-to-notelist text-center">
						독서노트 모아보기 <i class="bi bi-emoji-sunglasses"></i>
					</div>
					<c:import url="/WEB-INF/jsp/include/profileIcon.jsp" />
				</div>
				
				<div class="content-section">
					<div class="note-box">
						<div class="d-flex justify-content-between">
							<!-- 삭제 버튼 -->
							<a href="#" id="deleteNote" data-isbn-id="<%= request.getParameter("isbn13") %>">
								<i class="bi bi-trash"></i>
							</a>
							<c:choose>
								<c:when test="${ note.createdAt eq note.updatedAt }">
									<div class="create-date">작성일 <fmt:formatDate value="${ note.createdAt }" pattern="yyyy년 M월 d일 HH시 mm분" /></div>
								</c:when>
								<c:otherwise>
									<div>
										<div class="create-date">작성일 <fmt:formatDate value="${ note.createdAt }" pattern="yyyy년 M월 d일 HH시 mm분" /></div>
										<div class="create-date">수정일 <fmt:formatDate value="${ note.updatedAt }" pattern="yyyy년 M월 d일 HH시 mm분" /></div>
									</div>	
								</c:otherwise>
							</c:choose>
							<!-- 수정 버튼 -->
							<a href="/library/edit_note?isbn13=<%= request.getParameter("isbn13") %>" id="editNote">
								<i class="bi bi-pencil-square"></i>
							</a>
						</div>
						<hr class="hr-tag">
						<div class="note-content">
							${ note.content }
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
			
			// 독서노트 삭제
			$("#deleteNote").on("click", function(e){
				
				e.preventDefault();
				
				let isbn13 = $(this).data("isbn-id");
				
				$.ajax({
					
					type:"get"
					, url:"/library/deleteNote_api"
					, data:{"isbn13":isbn13}
					, success:function(data){
						
						if (data.result == "success") {
							alert("독서노트를 삭제했습니다.");
							location.href = "/library";
						} else {
							alert("독서노트를 삭제하지 못했습니다.");
						}
						
					}
					, error:function(){
						alert("readingNote 삭제 통신 에러");
					}
					
				});
				
			});
			
		});
	
	
	</script>

</body>
</html>