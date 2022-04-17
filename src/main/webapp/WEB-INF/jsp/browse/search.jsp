<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>

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
					<div class="d-flex align-items-center">
						<div class="page-name">검색</div>
						<form id="searchForm">
							<input type="text" id="searchInput" class="search-input" placeholder="도서명, 작가명, 출판사명으로 검색">
							<button type="submit" id="searchBtn" class="search-btn">
								<i class="bi bi-search"></i>
							</button>
						</form>
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
				
				<!-- 검색창 -->
				<div>
					
				</div>
				
				
				<!-- 주목할만한 신간 리스트 -->
				<div class="outstanding">주목할만한 신간</div>
				
				<div class="outstanding-box d-flex flex-wrap">
				<c:forEach var="outstanding" items="${ outstandingBook.outstandingBook.item }">
					<div class="outstanding-book d-flex justify-content-center align-items-center">
						<div>
							<div>
							<c:choose>
								<c:when test="${ outstanding.cover ne null && outstanding.cover ne '' }">
									<a href="/book_info?isbn13=${ outstanding.isbn13 }">
										<img src="${ outstanding.cover }">
									</a>
								</c:when>
								<c:otherwise>
									<div OnClick="location.href='/book_info?isbn13=${ outstanding.isbn13 }'" style="cursor:pointer;" class="outstanding-thumbnail"></div>
								</c:otherwise>
							</c:choose>
							</div>
							<div class="outstanding-title">
								<a href="/book_info?isbn13=${ outstanding.isbn13 }" class="outstanding-title">
									${ fn:substring(outstanding.title, 0, 12 ) }
									<c:if test="${fn:length(outstanding.title) > 12}">
									...
									</c:if>
								</a>
							</div>
							<div>
								<a href="/book_info?isbn13=${ outstanding.isbn13 }" class="outstanding-author">
									${ fn:substring(outstanding.author, 0, 8 ) }
									<c:if test="${fn:length(outstanding.author) > 8}">
									...
									</c:if>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
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
			
			
			// 검색 버튼
			$("#searchForm").on("submit", function(e){
				
				e.preventDefault();
				
				let search = $("#searchInput").val().trim();
				
				// 유효성 검사
				if (search == "") {
					alert("검색어를 입력하세요.");
					return;
				}
				
				location.href="/browse/search_result?search=" + search;
				
			});
			
			
			
		});
	
	</script>
	
</body>
</html>