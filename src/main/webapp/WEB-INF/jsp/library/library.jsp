<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 서재</title>

	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
					<div class="page-name">내 서재</div>
					
					<div OnClick="location.href='/library/notelist'" style="cursor:pointer;" class="go-to-notelist text-center">
						독서노트 모아보기 <i class="bi bi-emoji-sunglasses"></i>
					</div>
						
					<div class="profile-icon">
						<c:choose>
							<c:when test="${ userProfileImg ne null and userProfileImg ne ''}">
								<a href="#" class="profile-link"><img src=""></a>
							</c:when>
							<c:otherwise>
								<a href="#" class="profile-link-icon" data-toggle="modal" data-target="#profileModal">
									<i class="bi bi-emoji-smile"></i>
								</a>
							</c:otherwise>
						</c:choose>
					</div>
					
				</div>
				
				<div class="content-section">
					
				<c:choose>
					<c:when test="${ !empty library }">
						<div class="d-flex flex-wrap">
						<c:forEach var="library" items="${ library }">
							<div class="library-box">
								<div class="d-flex align-items-center">
									<div>
										<!-- 삭제 버튼 -->
										<div class="mb-1">
											<a href="#" data-isbn-id="${ library.isbn13 }" class="library-delete-icon">
												<i class="bi bi-trash"></i>
											</a>
										</div>
									
										<!-- 책 표지 -->
										<div class="pt-1">
											<c:choose>
												<c:when test="${ library.cover ne null && library.cover ne '' }">
													<a href="/book_info?isbn13=${ library.isbn13 }">
														<img src="${ library.cover }">
													</a>
												</c:when>
												<c:otherwise>
													<div OnClick="location.href='/book_info?isbn13=${ library.isbn13 }'" style="cursor:pointer;" class="weeklyNew-thumbnail-box d-flex justify-content-center align-items-center">
														<div class="thumbnail-icon text-white"><i class="bi bi-book"></i></div>
													</div>
												</c:otherwise>
											</c:choose>
										</div>	
										
										<!-- 독서노트 -->
										<div class="mt-1">
										<c:choose>
											<c:when test="${ library.noteIsDuplicate }">
												<a href="/library/note_view?isbn13=${ library.isbn13 }" class="go-to-bookReport">
												독서노트 보러 가기 <span class="see-note-icon"><i class="bi bi-eyeglasses"></i></span>
												</a>
											</c:when>
											<c:otherwise>
												<a href="/library/create_note?isbn13=${ library.isbn13 }" class="go-to-bookReport">
													독서노트 쓰러 가기 <span class="write-note-icon"><i class="bi bi-pencil"></i></span>
												</a>
											</c:otherwise>	
										</c:choose>
										</div>
									</div>
									
									<!-- 책 정보 -->
									<div class="library-bookinfo-box ml-3">
										
										
										<!-- 책 정보 -->
										<div class="library-subject">제목</div>
										<div>
											<a href="/book_info?isbn13=${ library.isbn13 }" class="library-title">
											 	${ library.title }
											</a>
										</div>
										<div class="library-subject">작가</div>
										<div>
											<a href="/book_info?isbn13=${ library.isbn13 }" class="library-author">
												${ library.author }
											</a>
										</div>
										
										<!--  완독 날짜 -->
										<div class="library-subject">완독 날짜</div>
										<div class="library-readDate">
											<fmt:formatDate var="readDate" value="${ library.readDate }" pattern="yyyy년 M월 d일"/>
											<input type="text" id="readDateInput${ library.isbn13 }" placeholder="${ readDate }" class="library-readDate-input">
											<button type="button" data-isbn-id="${ library.isbn13 }" class="edit-readDate-btn">
												<span class="edit-readDate-icon"><i class="bi bi-pencil"></i></span>
											</button>
											
										</div>
										
										<!-- 추천 -->
										<div class="library-subject">나의 추천</div>
										<div>
											<div>
											<c:choose>
												<c:when test="${ library.recommendIsDuplicate }">
													<a href="#" data-isbn-id="${ library.isbn13 }" class="delete-recommend">
														<i class="bi bi-hand-thumbs-up-fill"></i> <span>추천하는 소설입니다!</span>
													</a>
												</c:when>
												<c:otherwise>
													<a href="#" data-isbn-id="${ library.isbn13 }" class="add-recommend">
														<i class="bi bi-hand-thumbs-up"></i> <span>추천하기</span>
													</a>
												</c:otherwise>	
											</c:choose>
											</div>
											<div>
												
											</div>
										</div>
									</div>
								</div>
								
							</div>
						</c:forEach>	
						</div>
					</c:when>
					<c:otherwise>
						<div class="library-isEmpty-box d-flex align-items-center">
							<div class="library-isEmpty text-center">
								<i class="library-isEmpty-icon bi bi-bookshelf"></i><br>
								내 서재가 비어있습니다.
							</div>
						</div>
					</c:otherwise>
				</c:choose>	
				</div>
				
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
					
			</div>
		</div>
	
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		    	<div class="text-center modal-text">
		    		${ userNickname } 님
		    		<hr>
		    	</div>
			    <div class="modal-body text-center">
			    	<a href="#" class="modal-link">프로필 관리</a>
			    </div>
			    <div class="logout-modal modal-body text-center">
			    	<a href="/user/sign_out" class="modal-link">로그아웃</a>
			    </div>
		    </div>
		</div>
	</div>
	
	
	<script>
	
		$(document).ready(function(){
			
			$.datepicker.setDefaults({
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
                , dateFormat: 'yy-mm-dd'
            });
			
			// 완독 날짜 선택
			$(".library-readDate-input").datepicker({
				
				showButtonPanel: true 
				, changeMonth: true
                , changeYear: true
                , showAnim: "clip"
				
			});

			
			
			// 완독 날짜 수정
			$(".edit-readDate-btn").on("click", function(){
				
				let isbn13 = $(this).data("isbn-id");
				let readDate = $("#readDateInput" + isbn13).val().trim();
				
				if (readDate == "") {
					alert("완독 날짜란을 선택해 완독 날짜를 입력해주세요.");
					return;
				}
				
				$.ajax({
					
					type:"get"
					, url:"/library/update_readDate"
					, data:{"isbn13":isbn13, "readDate":readDate}
					, success:function(data){
						
						if (data.result == "success") {
							alert("완독 날짜가 수정되었습니다.");
							location.reload();
						} else {
							alert("완독 날짜를 수정하지 못했습니다:(");
						}
						
					}
					, error:function(){
						alert("readDate 통신 에러");
					}
					
				});
				
				
			});
			
			
			
			// 추천하기
			$(".add-recommend").on("click", function(e){
				
				e.preventDefault();
				
				let isbn13 = $(this).data("isbn-id");
				
				$.ajax({
					
					type:"get"
					, url:"/library/recommend_api"
					, data:{"isbn13":isbn13}
					, success:function(data){
						
						if (data.result == "success") {
							alert("추천되었습니다.");
							location.reload();
						} else {
							alert("추천을 누르지 못했습니다:(");
						}
						
					}
					, error:function(){
						alert("recommend 통신 에러");
					}
					
				});
				
			});
			
			
			// 추천해제
			$(".delete-recommend").on("click", function(e){
				
				e.preventDefault();
				
				let isbn13 = $(this).data("isbn-id");
				
				$.ajax({
					
					type:"get"
					, url:"/library/deleteRecommend_api"
					, data:{"isbn13":isbn13}
					, success:function(data){
						
						if (data.result == "success") {
							alert("추천을 취소했습니다.");
							location.reload();
						} else {
							alert("추천을 취소하지 못했습니다.");
						}
						
					}
					, error:function(){
						alert("recommend 삭제 통신 에러");
					}
					
				});
				
			});
			
			
			// 내 서재에서 삭제
			$(".library-delete-icon").on("click", function(e){
				
				e.preventDefault();
				
				let isbn13 = $(this).data("isbn-id");
				
				$.ajax({
					
					type:"get"
					, url:"/library/deleteBook_api"
					, data:{"isbn13":isbn13}
					, success:function(data){
						
						if (data.result == "success") {
							alert("내 서재에서 삭제했습니다.");
							location.reload();
						} else {
							alert("내 서재에서 삭제하지 못했습니다.");
						}
						
					}
					, error:function(){
						alert("library 삭제 통신 에러");
					}
					
				});
				
			});
			
		});
			
			
	</script>
	
	
</body>
</html>