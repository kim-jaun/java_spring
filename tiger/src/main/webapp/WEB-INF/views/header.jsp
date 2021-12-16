<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="header">
		<span class="left">
			<a href="main.do">
				<img alt="" src="/tiger/resources/main/logo.png" class="logo">
			</a>
		</span>
		<span class="header_login">
			<c:if test="${sessionScope.MB_id == null }">
				<a href="joinForm.do">회원가입</a>
				<a href="loginForm.do">로그인</a>
			</c:if>
			<c:if test="${sessionScope.MB_id != null }">
				<c:if test="${sessionScope.MB_id == 'admin'}">
					<a href="adminMain.do">관리자 페이지</a>
				</c:if>
				<c:if test="${sessionScope.MB_id != 'admin'}">
					${sessionScope.MB_nickName }님 환영합니다
				</c:if>
				<a href="logout.do">로그아웃</a>
			</c:if>
		</span>
	</div>
</body>
</html>