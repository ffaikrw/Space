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
							<div><a href="#" class="home-subtitle">4월 둘째 주 신작</a></div>
							<div OnClick="location.href='#'" style="cursor:pointer;" class="top-content bg-warning">
							
							</div>
						</div>
						<div class="top-box">
							<div><a href="#" class="home-subtitle">베스트셀러</a></div>
							<div OnClick="location.href='#'" style="cursor:pointer;" class="top-content bg-success">
							
							</div>
						</div>
						<div class="top-box">
							<div><a href="#" class="home-subtitle">오늘의 추천 소설</a></div>
							<div OnClick="location.href='#'" style="cursor:pointer;" class="top-content bg-primary">
							
							</div>
						</div>
					</div>
					<div class="content-top10 mt-5">
						<div><a href="#" class="home-subtitle">오늘의 10가지 소설</a></div>
						<div class="d-flex">
							<div class="prev arrow-icon mt-5">
								<i class="bi bi-caret-left-fill"></i>
							</div>
							<div class="slide-wrapper">
								<div class="slides">
									<div class="top10-box d-flex">
										<div class="home-subtitle">1</div>
										<div>
											<div class="top10-bookImg bg-info"></div>
											<div class="top10-bookTitle pl-3 mt-1">책 제목</div>
										</div>
									</div>
									<div class="top10-box d-flex">
										<div class="home-subtitle">2</div>
										<div>
											<div class="top10-bookImg bg-warning"></div>
											<div class="top10-bookTitle pl-3 mt-1">책 제목</div>
										</div>
									</div>
									<div class="top10-box d-flex">
										<div class="home-subtitle">3</div>
										<div>
											<div class="top10-bookImg bg-danger"></div>
											<div class="top10-bookTitle pl-3 mt-1">아주아주긴책제목12자제한</div>
										</div>
									</div>
									<div class="top10-box d-flex">
										<div class="home-subtitle">4</div>
										<div>
											<div class="top10-bookImg bg-secondary"></div>
											<div class="top10-bookTitle pl-3 mt-1">책 제목</div>
										</div>
									</div>
									<div class="top10-box d-flex">
										<div class="home-subtitle">5</div>
										<div>
											<div class="top10-bookImg bg-primary"></div>
											<div class="top10-bookTitle pl-3 mt-1">책 제목</div>
										</div>
									</div>
									<div class="top10-box d-flex">
										<div class="home-subtitle">6</div>
										<div>
											<div class="top10-bookImg bg-dark"></div>
											<div class="top10-bookTitle pl-3 mt-1">책 제목</div>
										</div>
									</div>
									<div class="top10-box d-flex">
										<div class="home-subtitle">7</div>
										<div>
											<div class="top10-bookImg bg-white"></div>
											<div class="top10-bookTitle pl-3 mt-1">책 제목</div>
										</div>
									</div>
									<div class="top10-box d-flex">
										<div class="home-subtitle">8</div>
										<div>
											<div class="top10-bookImg bg-success"></div>
											<div class="top10-bookTitle pl-3 mt-1">책 제목</div>
										</div>
									</div>
									<div class="top10-box d-flex">
										<div class="home-subtitle">9</div>
										<div>
											<div class="top10-bookImg bg-warning"></div>
											<div class="top10-bookTitle pl-3 mt-1">책 제목</div>
										</div>
									</div>
									<div class="top10-box d-flex">
										<div class="home-subtitle">10</div>
										<div>
											<div class="top10-bookImg bg-danger"></div>
											<div class="top10-bookTitle pl-3 mt-1">책 제목</div>
										</div>
									</div>
								</div>
							</div>
							<div class="next arrow-icon mt-5">
								<i class="bi bi-caret-right-fill"></i>
							</div>
						</div>
					</div>
					<div class="content-wishlist mt-5">
						<div><a href="#" class="home-subtitle">읽어볼까 한 소설</a></div>
						<div class="d-flex mt-2">
							<div class="mr-3">
								<div class="wish-bookImg bg-danger"></div>
								<div class="top10-bookTitle mt-1">책 제목</div>
							</div>
							<div class="mr-3">
								<div class="wish-bookImg bg-warning"></div>
								<div class="top10-bookTitle mt-1">책 제목</div>
							</div>
							<div class="mr-3">
								<div class="wish-bookImg bg-white"></div>
								<div class="top10-bookTitle mt-1">책 제목</div>
							</div>
							<div class="mr-3">
								<div class="wish-bookImg bg-info"></div>
								<div class="top10-bookTitle mt-1">책 제목</div>
							</div>
							<div class="mr-3">
								<div class="wish-bookImg bg-dark"></div>
								<div class="top10-bookTitle mt-1">책 제목</div>
							</div>
							<div class="mr-3">
								<div class="wish-bookImg bg-success"></div>
								<div class="top10-bookTitle mt-1">책 제목</div>
							</div>
							<div class="d-flex justify-content-center align-items-center">
								<a href="#" class="more-text">더보기</a>
							</div>
						</div>
					</div>
					<div class="content-author mt-5">
						<div><a href="#" class="home-subtitle">서재 속 작가들</a></div>
						<div class="d-flex">
							<div class="arrow-icon d-flex align-items-center">
								<i class="bi bi-caret-left-fill"></i>
							</div>
							<div OnClick="location.href='#'" style="cursor:pointer;" class="author-box d-flex justify-content-center align-items-center">
								<div class="author-name">작가명1</div>
							</div>
							<div OnClick="location.href='#'" style="cursor:pointer;" class="author-box d-flex justify-content-center align-items-center">
								<div class="author-name">작가명2</div>
							</div>
							<div OnClick="location.href='#'" style="cursor:pointer;" class="author-box d-flex justify-content-center align-items-center">
								<div class="author-name">작가명2</div>
							</div>
							<div OnClick="location.href='#'" style="cursor:pointer;" class="author-box d-flex justify-content-center align-items-center">
								<div class="author-name">작가명2</div>
							</div>
							<div OnClick="location.href='#'" style="cursor:pointer;" class="author-box d-flex justify-content-center align-items-center">
								<div class="author-name">작가명2</div>
							</div>
							<div class="arrow-icon d-flex align-items-center">
								<i class="bi bi-caret-right-fill"></i>
							</div>
						</div>
					</div>
					<div class="content-media mt-5">
						<div><a href="#" class="home-subtitle">드라마/영화/애니메이션 원작 소설</a></div>
						<div class="d-flex mt-2">
							<div class="mr-3">
								<div class="wish-bookImg bg-primary"></div>
								<div class="top10-bookTitle mt-1">책 제목</div>
							</div>
							<div class="mr-3">
								<div class="wish-bookImg bg-primary"></div>
								<div class="top10-bookTitle mt-1">책 제목</div>
							</div>
							<div class="mr-3">
								<div class="wish-bookImg bg-primary"></div>
								<div class="top10-bookTitle mt-1">책 제목</div>
							</div>
							<div class="mr-3">
								<div class="wish-bookImg bg-primary"></div>
								<div class="top10-bookTitle mt-1">책 제목</div>
							</div>
							<div class="mr-3">
								<div class="wish-bookImg bg-primary"></div>
								<div class="top10-bookTitle mt-1">책 제목</div>
							</div>
							<div class="mr-3">
								<div class="wish-bookImg bg-primary"></div>
								<div class="top10-bookTitle mt-1">책 제목</div>
							</div>
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
		
		var slides = document.querySelector('.slides'),
			slide = document.querySelectorAll('.slides .top10-box'),
			currentIndex = 0,
			slideCount = slide.length,
			slideWidth = 170,
			slideMargin = 30,
			prevBtn = document.querySelector('.prev'),
			nextBtn = document.querySelector('.next');
		
			slides.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + 'px';
			
			function moveSlide(num) {
				slides.style.left = -num * (slideWidth + slideMargin) + 'px';
				currentIndex = num;
			}
			
			nextBtn.addEventListener('click', function(){
				if (currentIndex < (slideCount - 5)) {
					moveSlide(currentIndex + 1);
				} else {
					moveSlide(0);
				}
			});
			
			prevBtn.addEventListener('click', function(){
				if (currentIndex > 0) {
					moveSlide(currentIndex - 1);
				} else {
					moveSlide(slideCount - 5);
				}
			});
			
			
			
		
			
	</script>

</body>
</html>