<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>space</title>

	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- bootstrap CDN link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- stylesheet -->
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	
	<div id="wrap-start">
	
		<div class="background-wrap">
			<div class="start-content">
				
				<header class="d-flex justify-content-between">
					<div class="header-logo">
						<span>space</span>
					</div>
					<div class="header-btn">
						<a href="#"><button class="signin-btn">로그인</button></a>
						<a href="/user/sign_up"><button class="signup-btn">회원가입</button></a>
					</div>
				</header>
				<section class="start-section d-flex align-items-center">
					<div>
						<div class="start-text1 text-white">
							책의 수는 점점 늘어날 것이고, <br>
							사람은 책에서 무언가를 배우는 것이 <br>
							우주 전체를 직접 연구하는 데서 배우는 것과 비슷한 정도로 <br>
							어려워질 때가 올 것을 예견할 수 있다. <br>
							자연에 숨어있는 진실의 일부를 탐구하는 것이 <br>
							방대한 수의 책에 숨겨진 진실을 탐색하는 것과 비슷하게 편해질 것이다. <br>
						</div>
						<div class="d-flex justify-content-end">
							<div class="start-text2">
								드니 디드로 Denis Diderot
							</div>
						</div>
					</div>
				</section>
				
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
			</div>
		</div>
	
	</div>
	
	
</body>
</html>