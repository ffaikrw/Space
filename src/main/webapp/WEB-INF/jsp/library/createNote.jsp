<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서노트 기록하기</title>

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
					<div class="page-name">독서노트 기록하기</div>
					
					<c:import url="/WEB-INF/jsp/include/profileIcon.jsp" />
				</div>
				
				<div class="content-section">
					<div class="readingNote-box d-flex justify-content-center align-items-center">
						<div class="editor-box">
							<textarea id="contentInput" class="summernote"></textarea>
						</div>
					</div>
					
					<div class="create-btn-box d-flex justify-content-end">
						<button type="button" id="createBtn" data-isbn-id="<%= request.getParameter("isbn13") %>" class="create-note-btn">기록</button>
					</div>
				</div>
				
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
				
			</div>	
				
		
		</div>
	
	</div>
	
	<c:import url="/WEB-INF/jsp/include/profileModal.jsp" />
	
	
	
	<script>
	
		$('.summernote').summernote({
			height: 500,
			lang: "ko-KR",
			focus : true,
			toolbar: [
			   ['fontname', ['fontname']],
			   ['fontsize', ['fontsize']],
			   ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			   ['color', ['forecolor','color']],
			   ['para', ['ul', 'ol', 'paragraph']],
			   ['height', ['height']],
			   ['view', ['help']]
			 ]
			, fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체']
			, fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
			
		});
		
		$(document).ready(function(){
			
			// 작성 버튼
			$("#createBtn").on("click", function(){
				
				let isbn13 = $(this).data("isbn-id");
				let content = $("#contentInput").val();
				
				if (content == "") {
					alert("노트를 작성해주세요.");
					return;
				}
				
				$.ajax({
					
					type:"post"
					, url:"/library/createNote_api"
					, data:{"isbn13":isbn13, "content":content}
					, success:function(data){
						
						if (data.result == "success") {
							alert("독서노트가 기록되었습니다.");
							location.href="/library/note_view?isbn13=" + isbn13;
						} else {
							alert("독서노트를 기록하지 못했습니다:(");
						}
						
					}
					, error:function(){
						alert("readingNote 통신 에러");
					}
					
				});
				
			});
			
			
			
		});
		
	</script>

</body>
</html>