<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>

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
					<div>
						<form id="searchForm">
							<input type="text" id="searchInput" class="search-input" placeholder="'<%= request.getParameter("search") %>' 검색결과">
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
				
				
				
				<div class="content-section d-flex flex-wrap">
				<c:choose>
					<c:when test="${ !empty search }">
						<div class="total-results">${ search[0].bookResultInfo.totalResult }개의 도서가 검색되었습니다.</div>
						<c:forEach var="searchResult" items="${ search }">
							<div class="book-box d-flex align-items-center">
							<div>	
								<div class="book-img-box d-flex">
								<c:choose>
									<c:when test="${ searchResult.cover ne null && searchResult.cover ne '' }">
										<a href="/book_info?isbn13=${ searchResult.isbn13 }">
											<img src="${ searchResult.cover }" >
										</a>
									</c:when>
									<c:otherwise>
										<div OnClick="location.href='/book_info?isbn13=${ searchResult.isbn13 }'" style="cursor:pointer;" class="thumbnail-box d-flex justify-content-center align-items-center">
											<div class="thumbnail-icon text-white"><i class="bi bi-book"></i></div>
										</div>
									</c:otherwise>
								</c:choose>
								</div>
								<div class="book-title">
									<a href="/book_info?isbn13=${ searchResult.isbn13 }" class="title-link">
										${ fn:substring(searchResult.title, 0, 18 ) }
										<c:if test="${fn:length(searchResult.title) > 18}">
										...
										</c:if>
									</a>
								</div>
								<div>
								<c:choose>
									<c:when test="${fn:length(searchResult.authorList) > 3}">
									<c:forEach var="author" items="${ searchResult.authorList }" end="2">
										<a href="/author?author=${ author }" class="book-author">${ author }</a>
									</c:forEach>
									...
									</c:when>
									<c:otherwise>
										<c:forEach var="author" items="${ searchResult.authorList }">
											<a href="/author?author=${ author }" class="book-author">${ author }</a>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</div>
								<div class="d-flex">
									<div class="">
										<i class="recommend-icon bi bi-hand-thumbs-up-fill"></i>
									</div>
									<div class="book-recommend ml-1">${ searchResult.recommendCount }</div>
								</div>
							</div>
							</div>
						</c:forEach>
						<div class="w-100 mt-5 d-flex justify-content-center">
						<c:if test="${ search[0].bookResultInfo.endIndex ne 1 }">
							<c:forEach var="page" begin="1" end="${ search[0].bookResultInfo.endIndex }" varStatus="status">
								<div class="page-button d-flex align-items-center justify-content-center">
									<a href="/browse/search_result?search=<%= request.getParameter("search") %>&page=${ status.count }" class="page-number">
										${ status.count }
									</a>
								</div>
							</c:forEach>
						</c:if>
						</div>
					</c:when>
					<c:otherwise>
						<div class="search-result-none">
							'<%= request.getParameter("search") %>'의 검색 결과가 없습니다 <i class="bi bi-emoji-frown"></i>
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