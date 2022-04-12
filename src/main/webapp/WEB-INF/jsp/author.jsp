<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<div class="page-name">'저자명' 작가의 소설</div>
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
					<div class="book-box bg-dark mt-3">
						<div class="book-img-box d-flex justify-content-center">
							<div class="book-img"></div>
						</div>
						<div class="book-title text-center"></div>
						<div class="book-author text-center"></div>
						<div class="d-flex justify-content-center">
							<div class="">
								<i class="recommend-icon bi bi-hand-thumbs-up-fill"></i>
							</div>
							<div class="book-recommend ml-1">441</div>
						</div>
					</div>
					
				</div>
					
					
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
			
			var author = "히가시노 게이고";
			
			$.ajax({
				method: "get"
				, url: "https://dapi.kakao.com/v3/search/book?target=person"
				, data: {query:author}
				, headers: {Authorization: "KakaoAK 5170fc7c6355db5c1438e9b2e64d78bb"}
				, success:function(data){
					
						$(".result").append(data.documents.length);
					
					for(var i = 0; i < 2; i++) {
						
						
						$(".book-img").append("<img src='" + data.documents[i].thumbnail + "' />");
						$(".book-title").append(data.documents[i].title + "<br>");
						$(".book-author").append(data.documents[i].authors + "<br>");
						
					}
					
					
				}
				, error:function(){
					alert("api 연결 통신 에러");
				}
			});
			
			
		});
	
	</script>
	
</body>
</html>