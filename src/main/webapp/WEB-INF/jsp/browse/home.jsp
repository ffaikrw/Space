<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
							<div OnClick="location.href='/browse/weekly_new'" style="cursor:pointer;" class="top-content">
								<div class="home-weeklyNew-title d-flex justify-content-center align-items-center">
									<div>
										<
										${ fn:substring(home.homeWeeklyNew.title, 0, 13 ) }
										<c:if test="${fn:length(home.homeWeeklyNew.title) > 13}">
										...
										</c:if>
										>
									</div>
								</div>
								<div class="home-weeklyNew d-flex justify-content-between align-items-center">
									<img src="${ home.homeWeeklyNew.cover }">
									<div class="home-weeklyNew-description">
										<b>외 200권</b>의<br>이번 주 신작의 우주를<br> 탐험해보세요!
									</div>
								</div>
							</div>
						</div>
						<div class="top-box">
							<div><a href="/browse/bestseller" class="home-subtitle">이번 주 베스트셀러</a></div>
							<div OnClick="location.href='/browse/bestseller'" style="cursor:pointer;" class="top-content">
								<div class="home-weeklyNew-title d-flex justify-content-center align-items-center">
									<div>뭘 읽어야할지 모르겠다면?</div>
								</div>
								<div class="home-weeklyNew d-flex justify-content-between align-items-center">
									<img src="${ home.homeBestseller.cover }">
									<div class="home-weeklyNew-description">
										<b>
										<
										${ fn:substring(home.homeBestseller.title, 0, 6 ) }
										<c:if test="${fn:length(home.homeBestseller.title) > 6}">
										...
										</c:if>
										>
										 외<br>200권</b>의 베스트셀러를<br>먼저 만나보세요.
									</div>
								</div>
							</div>
						</div>
						<div class="top-box">
							<div><a href="/browse/editor_recommend" class="home-subtitle">편집자 추천 소설</a></div>
							<div OnClick="location.href='/browse/editor_recommend'" style="cursor:pointer;" class="top-content">
								<div class="home-weeklyNew-title d-flex justify-content-center align-items-center">
									<div>편집자가 추천해드립니다!</div>
								</div>
								<div class="home-weeklyNew d-flex justify-content-between align-items-center">
									<img src="${ home.homeEditorRecommend.cover }">
									<div class="home-weeklyNew-description">
										<b>
										<
										${ fn:substring(home.homeEditorRecommend.title, 0, 6 ) }
										<c:if test="${fn:length(home.homeEditorRecommend.title) > 6}">
										...
										</c:if>
										>
										 외<br>200권</b>의 소설을<br>space 편집자가<br>추천해드립니다.
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 오늘의 10가지 소설 --> 
					<div class="content-top10 mt-5">
						<div class="home-subtitle">space TOP 10</div>
						<div class="d-flex mt-3">
							<div class="top10-prev arrow-icon mt-5">
								<i class="bi bi-caret-left-fill"></i>
							</div>
							<div class="top10-slide-wrapper">
								<div class="top10-slides">
								<c:forEach var="homeTop10" items="${ home.todayTop10 }" varStatus="status">
									<div class="top10-box d-flex">
										<div class="home-subtitle">${ status.count }</div>
										<div OnClick="location.href='/book_info?isbn13=${ homeTop10.isbn13 }'" style="cursor:pointer;" class="top10-book-box">
											<img src="${ homeTop10.cover }" >
											<div class="top10-bookTitle">
												${ fn:substring(homeTop10.title, 0, 12 ) }
												<c:if test="${fn:length(homeTop10.title) > 12}">
												...
												</c:if>
											</div>
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
					<c:if test="${ !empty home.homeWishlist }">
					<div class="content-wishlist mt-3">
						<div><a href="/wishlist" class="home-subtitle">읽어볼까 한 소설</a></div>
						<div class="d-flex mt-2">
						<c:forEach var="homeWish" items="${ home.homeWishlist }" end="7" varStatus="status">	
							<div class="homeWish-box d-flex align-items-center justify-content-center">
								<div OnClick="location.href='/book_info?isbn13=${ homeWish.isbn13 }'" style="cursor:pointer;">
									<img src="${ homeWish.cover }">
									<div class="top10-bookTitle mt-1">
										${ fn:substring(homeWish.title, 0, 12 ) }
										<c:if test="${fn:length(homeWish.title) > 12}">
										...
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
						<c:if test="${ fn:length(home.homeWishlist) > 8 }">
							<div class="d-flex justify-content-center align-items-center">
								<a href="/wishlist" class="more-text">더보기</a>
							</div>
						</c:if>
						</div>
					</div>
					</c:if>
					
					<!-- 서재 속 작가들 -->
					<c:if test="${ !empty home.homeLibrary }">
					<div class="content-author mt-5">
						<div class="home-subtitle">서재 속 작가들</div>
						<div class="d-flex mt-3">
							<div class="author-prev arrow-icon d-flex align-items-center">
								<i class="bi bi-caret-left-fill"></i>
							</div>
							<div class="author-slide-wrapper">
								<div class="author-slides">
								<c:forEach var="homeAuthors" items="${ home.homeLibrary }" varStatus="status">
									<div OnClick="location.href='/author?author=${ homeAuthors.authorList[0] }'" style="cursor:pointer;" class="author-box d-flex justify-content-center align-items-center">
										<div class="author-name">
											${ fn:substring(homeAuthors.authorList[0], 0, 8 ) }
											<c:if test="${fn:length(homeAuthors.authorList[0]) > 9}">
											...
											</c:if>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
							<div class="author-next arrow-icon d-flex align-items-center">
								<i class="bi bi-caret-right-fill"></i>
							</div>
						</div>
					</div>
					</c:if>
					
					<!-- 나의 책장 -->
					<c:if test="${ !empty home.homeLibrary }">
					<div class="content-media mt-3">
						<div><a href="/library" class="home-subtitle">나의 책장</a></div>
						<div class="d-flex mt-2">
						<c:forEach var="homeLibrary" items="${ home.homeLibrary }" end="7" varStatus="status">
							<div class="homeWish-box d-flex align-items-center justify-content-center">
								<div OnClick="location.href='/book_info?isbn13=${ homeLibrary.isbn13 }'" style="cursor:pointer;">
									<img src="${ homeLibrary.cover }">
									<div class="top10-bookTitle mt-1">
										${ fn:substring(homeLibrary.title, 0, 12 ) }
										<c:if test="${fn:length(homeLibrary.title) > 12}">
										...
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
						<c:if test="${ fn:length(home.homeLibrary) > 8 }">
							<div class="d-flex justify-content-center align-items-center">
								<a href="/library" class="more-text">더보기</a>
							</div>
						</c:if>
						</div>
					</div>
					</c:if>
					
					<div class="content-bottom mb-5">
						<div class="home-subtitle mt-5">아직 고민 중이신가요?</div>
						<div class="mt-2">
							<a href="/book_info?isbn13=${ home.randomIsbn13 }" class="more-text">
								읽어볼까 한 도서를 랜덤으로 감상해보세요!
							</a>
							<a href="#" id="reloadIcon" class="more-text ml-1"><i class="bi bi-arrow-clockwise"></i></a>
						</div>
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
			top10SlideWidth = 110,
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
			
		
		// 랜덤 선택 다시하기
		$("#reloadIcon").on("click", function(e){
			
			e.preventDefault();
			
			location.reload();
			
		});
			
		
			
	</script>

</body>
</html>