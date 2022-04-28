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
					<c:import url="/WEB-INF/jsp/include/profileIcon.jsp" />
				</div>
				
				<div class="content-section">
					<div class="content-top d-flex mt-5">
						<div class="top-box">
							<div><a href="/browse/weekly_new" class="home-subtitle">이번 주 신작</a></div>
							<div OnClick="location.href='/browse/weekly_new'" style="cursor:pointer;" class="top-content bg-warning">
								<div class="home-weeklyNew-title d-flex justify-content-center align-items-center">
									<div><나를 마릴린 먼로라고 하자></div>
								</div>
								<div class="home-weeklyNew d-flex justify-content-between align-items-center">
									<img src="" class="bg-white" width="85px" height="100px">
									<div class="home-weeklyNew-description">
										<b>외 200권</b>의<br>이번 주 신작의 우주를<br> 탐험해보세요!
									</div>
								</div>
							</div>
						</div>
						<div class="top-box">
							<div><a href="/browse/bestseller" class="home-subtitle">이번 주 베스트셀러</a></div>
							<div OnClick="location.href='/browse/bestseller'" style="cursor:pointer;" class="top-content bg-success">
								<div class="home-weeklyNew-title d-flex justify-content-center align-items-center">
									<div>뭘 읽어야할지 모르겠다면?</div>
								</div>
								<div class="home-weeklyNew d-flex justify-content-between align-items-center">
									<img src="" class="bg-white" width="85px" height="100px">
									<div class="home-weeklyNew-description">
										<b><살인자의 기억법> 외<br>200권</b>의 베스트셀러를<br>먼저 만나보세요.
									</div>
								</div>
							</div>
						</div>
						<div class="top-box">
							<div><a href="/browse/editor_recommend" class="home-subtitle">편집자 추천 소설</a></div>
							<div OnClick="location.href='/browse/editor_recommend'" style="cursor:pointer;" class="top-content bg-primary">
								<div class="home-weeklyNew-title d-flex justify-content-center align-items-center">
									<div>편집자가 추천해드립니다!</div>
								</div>
								<div class="home-weeklyNew d-flex justify-content-between align-items-center">
									<img src="" class="bg-white" width="85px" height="100px">
									<div class="home-weeklyNew-description">
										<b><휴남동 서점> 외<br>200권</b>의 소설을<br>space 편집자가<br>추천해드립니다.
									</div>
								</div>
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
					
					<!-- 나의 책장 -->
					<div class="content-media mt-5">
						<div><a href="#" class="home-subtitle">나의 책장</a></div>
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
	
	<c:import url="/WEB-INF/jsp/include/profileModal.jsp" />
	
	
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