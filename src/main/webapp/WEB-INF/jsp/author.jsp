<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서재 속 작가들</title>

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
					<div class="page-name">'<%= request.getParameter("author") %>' 작가의 저서</div>
					<div class="result font-weight-bold text-white"></div>
					
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
				<c:forEach var="authorInfo" items="${ author.authorInfo }">
					<div class="book-box">
						<div class="book-img-box d-flex">
						<c:choose>
							<c:when test="${ authorInfo.cover ne null && authorInfo.cover ne '' }">
								<a href="#" class="thumbnail-link"><img src="${ authorInfo.cover }"></a>
							</c:when>
							<c:otherwise>
								<div OnClick="location.href='#'" style="cursor:pointer;" class="thumbnail-box d-flex justify-content-center align-items-center">
									<div class="thumbnail-icon text-white"><i class="bi bi-book"></i></div>
								</div>
							</c:otherwise>
						</c:choose>
						</div>
						<div class="book-title">
							<a href="/book_info?isbn13=${ authorInfo.isbn13 }" class="title-link">
							${ fn:substring(authorInfo.title, 0, 13 ) }
							<c:if test="${fn:length(authorInfo.title) > 12}">
							...
							</c:if>
							</a>
						</div>
						<div class="book-author">
							<a href="/book_info?isbn13=${ authorInfo.isbn13 }" class="book-author">
								${ fn:substring(authorInfo.author, 0, 12 ) }
								<c:if test="${fn:length(authorInfo.author) > 12}">
								...
								</c:if>
							</a>
						</div>
						<div class="d-flex justify-content-center">
							<div class="">
								<i class="recommend-icon bi bi-hand-thumbs-up-fill"></i>
							</div>
							<div class="book-recommend ml-1">441</div>
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
	
	
</body>
</html>