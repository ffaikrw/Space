<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이번 주 베스트셀러</title>

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
					<div class="page-name">이번 주 베스트셀러</div>
					
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
				<c:forEach var="bestseller" items="${ bestsellerList.bestseller.item }" varStatus="status">
					<div class="weeklyNew-box">
						<div class="bestseller-rank">${ status.count }</div>
						<div class="d-flex align-items-center">
							<div class="weeklyNew-img-box d-flex">
								<div class="d-flex justify-content-center align-items-center">
								<c:choose>
									<c:when test="${ bestseller.cover ne null && bestseller.cover ne '' }">
										<a href="/book_info?isbn13=${ bestseller.isbn13 }"><img src="${ bestseller.cover }"></a>
									</c:when>
									<c:otherwise>
										<div OnClick="location.href='/book_info?isbn13=${ bestseller.isbn13 }'" style="cursor:pointer;" class="weeklyNew-thumbnail-box d-flex justify-content-center align-items-center">
											<div class="thumbnail-icon text-white"><i class="bi bi-book"></i></div>
										</div>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
							<div>
								<div>
									<a href="/book_info?isbn13=${ bestseller.isbn13 }" class="weeklyNew-title">
										<b>${ bestseller.title }</b>
									</a>
								</div>
								<div class="weeklyNew-author">
									${ bestseller.author }
								</div>
								<div class="weeklyNew-description">
									${ bestseller.description }
								</div>
							</div>
						</div>	
						<div>
							<a href="#" data-isbn-id="${ bestseller.isbn13 }" class="add-wishlist">읽어볼까? <i class="bi bi-heart"></i></a>
							<a href="#" data-isbn-id="${ bestseller.isbn13 }" class="delete-wishlist">읽어볼까에 담겼습니다! <i class="bi bi-heart-fill"></i></a>
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