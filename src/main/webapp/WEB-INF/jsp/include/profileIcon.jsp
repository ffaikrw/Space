<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div class="profile-icon">
			<c:choose>
				<c:when test="${ userProfileImg ne null and userProfileImg ne ''}">
					<div class="profile-link-box">
						<a href="#" class="profile-link" data-toggle="modal" data-target="#profileModal">
							<img src="${ userProfileImg }" class="profile-link-image">
						</a>
					</div>	
				</c:when>
				<c:otherwise>
					<a href="#" class="profile-link-icon" data-toggle="modal" data-target="#profileModal">
						<i class="bi bi-emoji-smile"></i>
					</a>
				</c:otherwise>
			</c:choose>
		</div>
