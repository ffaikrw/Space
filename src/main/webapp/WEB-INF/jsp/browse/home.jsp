<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>space 홈</title>

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
					<div class="page-name">홈</div>
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
					<div class="content-top d-flex mt-5">
						<div class="top-box">
							<div><a href="/browse/weekly_new" class="home-subtitle">이번 주 신작</a></div>
							<div OnClick="location.href='/browse/weekly_new'" style="cursor:pointer;" class="top-content bg-warning">
							
							</div>
						</div>
						<div class="top-box">
							<div><a href="/browse/bestseller" class="home-subtitle">이번 주 베스트셀러</a></div>
							<div OnClick="location.href='/browse/bestseller'" style="cursor:pointer;" class="top-content bg-success">
							
							</div>
						</div>
						<div class="top-box">
							<div><a href="/browse/editor_recommend" class="home-subtitle">편집자 추천 소설</a></div>
							<div OnClick="location.href='/browse/editor_recommend'" style="cursor:pointer;" class="top-content bg-primary">
							
							</div>
						</div>
					</div>
					
					<!-- 오늘의 10가지 소설 --> 
					<div class="content-top10 mt-5">
						<div><a href="#" class="home-subtitle">오늘의 10가지 소설</a></div>
						<div class="d-flex">
							<div class="top10-prev arrow-icon mt-5">
								<i class="bi bi-caret-left-fill"></i>
							</div>
							<div class="top10-slide-wrapper">
								<div class="top10-slides">
								<c:forEach var="i" begin="0" end="9" varStatus="status">
									<div class="top10-box d-flex">
										<div class="home-subtitle">${ status.count }</div>
										<div>
											<div class="top10-bookImg bg-info"></div>
											<div class="top10-bookTitle pl-3 mt-1">책 제목</div>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
							<div class="top10-next arrow-icon mt-5">
								<i class="bi bi-caret-right-fill"></i>
							</div>
						</div>
					</div>
					
					<!-- 읽어볼까 한 소설 --> 
					<div class="content-wishlist mt-5">
						<div><a href="#" class="home-subtitle">읽어볼까 한 소설</a></div>
						<div class="d-flex mt-2">
						<c:forEach var="i" begin="0" end="5" varStatus="status">	
							<div class="mr-3">
								<div class="wish-bookImg bg-warning"></div>
								<div class="top10-bookTitle mt-1">책 제목${ status.count }</div>
							</div>
						</c:forEach>
							<div class="d-flex justify-content-center align-items-center">
								<a href="#" class="more-text">더보기</a>
							</div>
						</div>
					</div>
					
					<!-- 서재 속 작가들 -->
					<div class="content-author mt-5">
						<div><a href="#" class="home-subtitle">서재 속 작가들</a></div>
						<div class="d-flex">
							<div class="author-prev arrow-icon d-flex align-items-center">
								<i class="bi bi-caret-left-fill"></i>
							</div>
							<div class="author-slide-wrapper">
								<div class="author-slides">
								<c:forEach var="i" begin="0" end="8" varStatus="status">
									<div OnClick="location.href='#'" style="cursor:pointer;" class="author-box d-flex justify-content-center align-items-center">
										<div class="author-name">작가명${ status.count }</div>
									</div>
								</c:forEach>
								</div>
							</div>
							<div class="author-next arrow-icon d-flex align-items-center">
								<i class="bi bi-caret-right-fill"></i>
							</div>
						</div>
					</div>
					
					<!-- 드라마/영화/애니메이션 원작 소설 -->
					<div class="content-media mt-5">
						<div><a href="#" class="home-subtitle">드라마/영화/애니메이션 원작 소설</a></div>
						<div class="d-flex mt-2">
						<c:forEach var="i" begin="0" end="5" varStatus="status">	
							<div class="mr-3">
								<div class="wish-bookImg bg-danger"></div>
								<div class="top10-bookTitle mt-1">책 제목${ status.count }</div>
							</div>
						</c:forEach>
							<div class="d-flex justify-content-center align-items-center">
								<a href="#" class="more-text">더보기</a>
							</div>
						</div>
					</div>
					<div class="content-bottom mb-5">
						<div class="home-subtitle mt-5">아직 고민 중이신가요?</div>
						<div class="mt-2"><a href="#" class="more-text">읽어볼까 한 도서를 랜덤으로 감상해보세요!</a></div>
					</div>
					
					
				
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
		
		// top10 멀티 슬라이드
		var top10Slides = document.querySelector('.top10-slides'),
			top10Slide = document.querySelectorAll('.top10-slides .top10-box'),
			top10CurrentIndex = 0,
			top10SlideCount = top10Slide.length,
			top10SlideWidth = 170,
			top10SlideMargin = 30,
			top10PrevBtn = document.querySelector('.top10-prev'),
			top10NextBtn = document.querySelector('.top10-next');
		
			top10Slides.style.width = (top10SlideWidth + top10SlideMargin) * top10SlideCount - top10SlideMargin + 'px';
			
			function top10MoveSlide(top10Num) {
				top10Slides.style.left = -top10Num * (top10SlideWidth + top10SlideMargin) + 'px';
				top10CurrentIndex = top10Num;
			}
			
			top10NextBtn.addEventListener('click', function(){
				if (top10CurrentIndex < (top10SlideCount - 5)) {
					top10MoveSlide(top10CurrentIndex + 1);
				} else {
					top10MoveSlide(0);
				}
			});
			
			top10PrevBtn.addEventListener('click', function(){
				if (top10CurrentIndex > 0) {
					top10MoveSlide(top10CurrentIndex - 1);
				} else {
					top10MoveSlide(top10SlideCount - 5);
				}
			});
			
			
		// 서재 속 작가들 멀티 슬라이드
		var authorSlides = document.querySelector('.author-slides'),
			authorSlide = document.querySelectorAll('.author-slides .author-box'),
			authorCurrentIndex = 0,
			authorSlideCount = authorSlide.length,
			authorSlideWidth = 170,
			authorSlideMargin = 15,
			authorPrevBtn = document.querySelector('.author-prev'),
			authorNextBtn = document.querySelector('.author-next');
		
			authorSlides.style.width = (authorSlideWidth + authorSlideMargin) * authorSlideCount - authorSlideMargin + 'px';
			
			function authorMoveSlide(num) {
				authorSlides.style.left = -num * (authorSlideWidth + authorSlideMargin) + 'px';
				authorCurrentIndex = num;
			}
			
			authorNextBtn.addEventListener('click', function(){
				if (authorCurrentIndex < (authorSlideCount - 4)) {
					authorMoveSlide(authorCurrentIndex + 1);
				} else {
					authorMoveSlide(0);
				}
			});
			
			authorPrevBtn.addEventListener('click', function(){
				if (authorCurrentIndex > 0) {
					authorMoveSlide(authorCurrentIndex - 1);
				} else {
					authorMoveSlide(authorSlideCount - 4);
				}
			});
			
		
		
			
		
			
	</script>

</body>
</html>