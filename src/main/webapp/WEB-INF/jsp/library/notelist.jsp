<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독서노트 모아보기</title>

	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- bootstrap CDN link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	
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
					<div class="page-name">독서노트 모아보기</div>
					<c:import url="/WEB-INF/jsp/include/profileIcon.jsp" />
				</div>
				
				<div class="content-section">
				<c:choose>
					<c:when test="${ !empty notelist }">
						<table class="notelist-table text-white text-center">
							<thead>
								<tr>
									<th>표지</th>
									<th>도서명</th>
									<th>내용</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="notelist" items="${ notelist }">
								<tr>
									<td class="notelist-cover">
										<a href="/book_info?isbn13=${ notelist.isbn }"><img src="${ notelist.cover }"></a>
									</td>
									<td class="notelist-title">
										<a href="/book_info?isbn13=${ notelist.isbn }" class="notelist-bookinfo-link">
											<b>${ notelist.title }</b>
										</a>
									</td>
									<td class="notelist-content">
										<a href="/library/note_view?isbn13=${ notelist.isbn }" class="notelist-noteView-link">
											${ notelist.content }
										</a>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</c:when>	
					<c:otherwise>
						<div class="text-white">작성한 독서노트가 없습니다.</div>
					</c:otherwise>
				</c:choose>	
				</div>
				
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
			
			</div>
		
		</div>
	
	</div>
	
	<c:import url="/WEB-INF/jsp/include/profileModal.jsp" />

</body>
</html>