<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세 정보</title>

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
					<div class="page-name">도서 정보</div>
					<c:import url="/WEB-INF/jsp/include/profileIcon.jsp" />
				</div>
				
				<div class="content-section">
				
					<div class="bookInfo-box d-flex align-items-center">
						<div class="book-bg d-flex justify-content-center">
						<c:choose>
							<c:when test="${ bookDetail.cover ne null && bookDetail.cover ne '' }">
								<img src="${ bookDetail.cover }">
							</c:when>
							<c:otherwise>
								<div class="bookInfo-img d-flex justify-content-center align-items-center">
									<div class="thumbnail-icon text-white"><i class="bi bi-book"></i></div>
								</div>
							</c:otherwise>
						</c:choose>
						</div>
						<div class="ml-3">
							<div class="bookInfo-subject">제목</div>
							<div class="bookInfo-title">${ bookDetail.title }</div>
							<div class="bookInfo-subject">저자</div>
							<div class="bookInfo-author">
							<c:forEach var="author" items="${ bookDetail.authorList }">
								<a href="/author?author=${ author }" class="bookInfo-author">${ author }</a> 
							</c:forEach>
							</div>
							<div class="bookInfo-subject">장르</div>
							<div class="bookInfo-category">
							<c:set var="genres" value="${ fn:split(bookDetail.categoryName, '>') }" />
							<c:forEach var="genre" items="${ genres }" begin="2">
								${ genre }.
							</c:forEach>
							</div>
						</div>
					</div>
					<div class="mt-3">
					<c:choose>
						<c:when test="${ bookDetail.libraryIsDuplicate }">
							<span class="bookInfo-in-library">내 서재의 책 <i class="bookInfo-in-library-icon bi bi-book-fill"></i></span>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${ bookDetail.wishIsDuplicate }">
									<a href="#" id="deleteWish" data-isbn-id="${ bookDetail.isbn13 }" class="bookInfo-wish">
										읽어볼 책 <i class="bookInfo-wish-icon bi bi-heart-fill"></i>
									</a>
								</c:when>
								<c:otherwise>
									<a href="#" id="addWish" data-isbn-id="${ bookDetail.isbn13 }" class="bookInfo-wish">
										읽어볼까? <i class="bookInfo-wish-icon bi bi-heart"></i>
									</a>
								</c:otherwise>
							</c:choose>
								<a href="#" id="addLibrary" data-isbn-id="${ bookDetail.isbn13 }" class="bookInfo-library">
									내 서재에 담기 <i class="bookInfo-library-icon bi bi-book"></i>
								</a>
						</c:otherwise>
					</c:choose>
					</div>
					
					<div class="d-flex">
						<div class="bookInfo-subtitle">한 줄 평</div>
						<c:if test="${ fn:length(bookDetail.reviewList) > 3 }">
							<a href="#" id="moreComment">더보기 <i class="bi bi-caret-down"></i></a>
							<a href="#" id="lessComment" class="d-none">접기 <i class="bi bi-caret-up"></i></a>
						</c:if>
						</div>
					<div class="comment-box mt-1">
					<c:choose>
						<c:when test="${ empty bookDetail.reviewList }">
							<div class="comment-list-box d-flex align-items-center">
								<div class="comment-content">
									한 줄 평이 없습니다.
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="review" items="${ bookDetail.reviewList }" >
							<div class="comment-wrap d-none">
								<div class="comment-list-box d-flex align-items-center">
									<div>
										<div class="comment-nickname">
											${ review.nickname }
											<c:if test="${ review.userId eq userId }">
												<a href="#" class="delete-comment" data-id="${ review.id }"><i class="bi bi-trash"></i></a>
											</c:if>
										</div>
										<div class="comment-date"><fmt:formatDate value="${ review.createdAt }" pattern="yyyy.MM.dd." /></div>
										<div class="comment-content">${ review.comment }</div>
									</div>
								</div>
							</div>	
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</div>
					<div class="write-comment-box">
						<input type="text" id="commentInput" placeholder="한 줄 평 작성하기(28자 제한)">
						<button id="commentBtn" data-isbn13-id="${ bookDetail.isbn13 }">작성</button>
					</div>
					
					<div class="bookInfo-wrap">
						<div class="bookInfo-subtitle d-flex">책 소개</div>
						<div class="bookInfo-description">
							${ bookDetail.description }
						</div>
						
						<div class="bookInfo-subtitle d-flex">기타 정보</div>
						<div class="bookInfo-description">
							<p><b>출판사</b> ${ bookDetail.publisher }</p>
							<p><b>출간일</b> <fmt:formatDate value="${ bookDetail.pubDate }" pattern="yyyy년 M월 d일" /></p>
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
			
			$(".comment-wrap").addClass("d-none");
			$(".comment-wrap").slice(0, 3).removeClass("d-none");
			
			// 한 줄 평 더보기
			$("#moreComment").on("click", function(e){
				
				e.preventDefault();
				
				$("#moreComment").addClass("d-none");
				$("#lessComment").removeClass("d-none");
				$(".comment-wrap").removeClass("d-none");
				$(".bookInfo-wrap").addClass("d-none");
				
			});
			
			
			// 한 줄 평 접기
			$("#lessComment").on("click", function(e){
				
				e.preventDefault();
				
				$("#lessComment").addClass("d-none");
				$("#moreComment").removeClass("d-none");
				
				$(".comment-wrap").addClass("d-none");
				$(".comment-wrap").slice(0, 3).removeClass("d-none");
				
				$(".bookInfo-wrap").removeClass("d-none");
				
			});
			
			
			
			// 한 줄 평 작성
			$("#commentBtn").on("click", function(){
				
				let isbn13 = $(this).data("isbn13-id");
				let comment = $("#commentInput").val().trim();
				
				if (comment == "") {
					return ;
				}
				
				if (comment.length > 28) {
					alert("한 줄 평은 28자까지만 작성 가능합니다.");
					return ;
				}
				
				
				$.ajax({
					
					type:"post"
					, url:"/review/add_review"
					, data:{"isbn13":isbn13, "comment":comment}
					, success:function(data){
						
						if (data.result == "success") {
							location.reload();
						} else {
							alert("한 줄 평을 작성하지 못했습니다:(");
						}
						
					}
					, error:function(){
						alert("review 작성 통신 에러");
					}
					
				});
				
			});
			
			
			// 한 줄 평 삭제
			$(".delete-comment").on("click", function(e){
				
				e.preventDefault();
				
				let id = $(this).data("id");
				
				$.ajax({
					
					type:"get"
					, url:"/review/delete_review"
					, data:{"id":id}
					, success:function(data){
						
						if (data.result == "success") {
							alert("한 줄 평을 삭제했습니다.")
							location.reload();
						} else {
							alert("한 줄 평을 삭제하지 못했습니다.");
						}
						
					}
					, error:function(){
						alert("review 삭제 통신 에러");
					}
					
				});
				
			});
			
			
			// 읽어볼까에 추가
			$("#addWish").on("click", function(e){
				
				e.preventDefault();
				
				let isbn13 = $(this).data("isbn-id");
				
				$.ajax({
					
					type:"get"
					, url:"/wishlist/addBook_api"
					, data:{"isbn13":isbn13}
					, success:function(data){
						
						if (data.result == "success") {
							location.reload();
						} else {
							alert("읽어볼까에 담지 못했습니다:(");
						}
						
					}
					, error:function(){
						alert("wishlist 추가 통신 에러");
					}
					
				});
				
			});
				
			
			// 읽어볼까에서 삭제
			$("#deleteWish").on("click", function(e){
				
				e.preventDefault();
				
				let isbn13 = $(this).data("isbn-id");
				
				$.ajax({
					
					type:"get"
					, url:"/wishlist/deleteBook_api"
					, data:{"isbn13":isbn13}
					, success:function(data){
						
						if (data.result == "success") {
							location.reload();
						} else {
							alert("읽어볼까에서 삭제하지 못했습니다.");
						}
						
					}
					, error:function(){
						alert("wishlist 삭제 통신 에러");
					}
					
				});
				
			});
			
			
			// 내 서재에 추가
			$("#addLibrary").on("click", function(e){
				
				e.preventDefault();
				
				let isbn13 = $(this).data("isbn-id");
				
				$.ajax({
					
					type:"get"
					, url:"/library/addBook_api"
					, data:{"isbn13":isbn13}
					, success:function(data){
						
						if (data.result == "success") {
							location.reload();
						} else {
							alert("내 서재에 담지 못했습니다:(");
						}
						
					}
					, error:function(){
						alert("library 추가 통신 에러");
					}
					
				});
				
			});
			
		});
	
	</script>
		
	
</body>
</html>