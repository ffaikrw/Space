<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이번 주 신작</title>

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
					<div class="page-name">이번 주 신작</div>
					<c:import url="/WEB-INF/jsp/include/profileIcon.jsp" />
				</div>
				
				<div class="content-section d-flex flex-wrap">
				<c:forEach var="weeklyNew" items="${ weeklyNew }">
					<div class="weeklyNew-box">
						<div class="d-flex align-items-center">
							<div class="weeklyNew-img-box d-flex">
								<div class="d-flex justify-content-center align-items-center">
								<c:choose>
									<c:when test="${ weeklyNew.cover ne null && weeklyNew.cover ne '' }">
										<a href="/book_info?isbn13=${ weeklyNew.isbn13 }"><img src="${ weeklyNew.cover }"></a>
									</c:when>
									<c:otherwise>
										<div OnClick="location.href='/book_info?isbn13=${ weeklyNew.isbn13 }'" style="cursor:pointer;" class="weeklyNew-thumbnail-box d-flex justify-content-center align-items-center">
											<div class="thumbnail-icon text-white"><i class="bi bi-book"></i></div>
										</div>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
							<div>
								<div>
									<a href="/book_info?isbn13=${ weeklyNew.isbn13 }" class="weeklyNew-title">${ weeklyNew.title }</a>
								</div>
								<div class="weeklyNew-author">
								<c:forEach var="author" items="${ weeklyNew.authorList }">
									<a href="/author?author=${ author }" class="weeklyNew-author">${ author }</a>
								</c:forEach>
								</div>
								<div class="weeklyNew-description">
									${ weeklyNew.description }
								</div>
							</div>
						</div>	
						<div class="mt-1">
						<c:choose>
							<c:when test="${ weeklyNew.libraryIsDuplicate }">
								<span class="in-library">내 서재의 책 <i class="bi bi-book-fill"></i></span>
							</c:when>
							<c:when test="${ weeklyNew.wishIsDuplicate }">
								<a href="#" data-isbn-id="${ weeklyNew.isbn13 }" class="delete-wishlist">읽어볼까에 담겼습니다! <i class="bi bi-heart-fill"></i></a>
							</c:when>
							<c:otherwise>
								<a href="#" data-isbn-id="${ weeklyNew.isbn13 }" class="add-wishlist">읽어볼까? <i class="bi bi-heart"></i></a>
							</c:otherwise>
						</c:choose>	
						</div>
					</div>
				</c:forEach>	
				</div>
				
				<div class="w-100 mt-5 d-flex justify-content-center">
				<c:if test="${ weeklyNew[0].bookResultInfo.endIndex ne 1 }">
					<c:forEach var="page" begin="1" end="${ weeklyNew[0].bookResultInfo.endIndex }" varStatus="status">
						<div class="page-button d-flex align-items-center justify-content-center">
							<a href="/browse/weekly_new?page=${ status.count }" class="page-number">
								${ status.count }
							</a>
						</div>
					</c:forEach>
				</c:if>
				</div>
				
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
					
			</div>
		</div>	
		
	</div>
	
	<c:import url="/WEB-INF/jsp/include/profileModal.jsp" />
	
	
	<script>
	
		$(document).ready(function(){
			
			// 읽어볼까에 추가
			$(".add-wishlist").on("click", function(e){
				
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
			$(".delete-wishlist").on("click", function(e){
				
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
			
		});
	
	</script>
	

</body>
</html>