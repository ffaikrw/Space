<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>읽어볼까?</title>

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
					<div class="page-name">읽어볼까?</div>
					<c:import url="/WEB-INF/jsp/include/profileIcon.jsp" />
				</div>
				
				<div class="content-section d-flex flex-wrap">
				<c:choose>
					<c:when test="${ !empty wishlist }">
						<c:forEach var="wishlist" items="${ wishlist }">
							<div class="d-flex align-items-center">
								<div class="book-box">
									<div class="book-img-box d-flex">
									<c:choose>
										<c:when test="${ wishlist.cover ne null && wishlist.cover ne '' }">
											<a href="/book_info?isbn13=${ wishlist.isbn13 }" class="thumbnail-link">
												<img src="${ wishlist.cover }">
											</a>
										</c:when>
										<c:otherwise>
											<div OnClick="location.href='/book_info?isbn13=${ wishlist.isbn13 }'" style="cursor:pointer;" class="thumbnail-box d-flex justify-content-center align-items-center">
												<div class="thumbnail-icon text-white"><i class="bi bi-book"></i></div>
											</div>
										</c:otherwise>
									</c:choose>
									</div>
									<div class="book-title">
										<a href="/book_info?isbn13=${ wishlist.isbn13 }" class="title-link">
										${ fn:substring(wishlist.title, 0, 13 ) }
										<c:if test="${fn:length(wishlist.title) > 13}">
										...
										</c:if>
										</a>
									</div>
									<div class="book-author">
									<c:choose>
										<c:when test="${fn:length(wishlist.authorList) > 3}">
										<c:forEach var="author" items="${ wishlist.authorList }" end="2">
											<a href="/author?author=${ author }" class="book-author">${ author }</a>
										</c:forEach>
										<span class="book-author">...</span>
										</c:when>
										<c:otherwise>
											<c:forEach var="author" items="${ wishlist.authorList }">
												<a href="/author?author=${ author }" class="book-author">${ author }</a>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									</div>
									<div class="d-flex justify-content-between">
										<div class="d-flex">
											<div>
												<i class="recommend-icon bi bi-hand-thumbs-up-fill"></i>
											</div>
											<div class="book-recommend ml-1">${ wishlist.recommendCount }</div>
										</div>
										<div>
											<a href="#" data-isbn-id="${ wishlist.isbn13 }" class="move-to-library">
												<i class="bi bi-book"></i>
											</a>
											<a href="#" data-isbn-id="${ wishlist.isbn13 }" class="wishlist-delete-icon">
												<i class="bi bi-trash"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="library-isEmpty-box d-flex align-items-center">
							<div class="library-isEmpty text-center">
								<i class="library-isEmpty-icon bi bi-book"></i><br>
								읽어볼까에 담은 책이 없습니다.
							</div>
						</div>
					</c:otherwise>
				</c:choose>
					
				</div>
				
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />	
					
			</div>
		</div>
	
	</div>
	
	<c:import url="/WEB-INF/jsp/include/profileModal.jsp" />
	
	
	<script>
	
		$(document).ready(function(){
			
			// 읽어볼까에서 삭제
			$(".wishlist-delete-icon").on("click", function(e){
				
				e.preventDefault();
				
				let isbn13 = $(this).data("isbn-id");
				
				$.ajax({
					
					type:"get"
					, url:"/wishlist/deleteBook_api"
					, data:{"isbn13":isbn13}
					, success:function(data){
						
						if (data.result == "success") {
							alert("읽어볼까에서 삭제했습니다.");
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
			
			
			// 내 서재로 이동
			$(".move-to-library").on("click", function(e){
				
				e.preventDefault();
				
				let isbn13 = $(this).data("isbn-id");
				
				$.ajax({
					
					type:"get"
					, url:"/library/addBook_api"
					, data:{"isbn13":isbn13}
					, success:function(data){
						
						if (data.result == "success") {
							alert("내 서재로 이동했습니다.");
							location.reload();
						} else {
							alert("내 서재로 이동하지 못했습니다.");
						}
						
					}
					, error:function(){
						alert("library 통신 에러");
					}
					
				});
				
			});
			
		});
	
	</script>
	
</body>
</html>