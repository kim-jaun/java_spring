<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css"
	href="${path }/resources/bootstrap/css/common.css">
</head>
<body>
	<div class="header">
		<span class="left">
			<a href="adminMain.do">
				<img alt="" src="${path }/resources/main/logo.png" class="logo">
			</a>
		</span>
		<span class="header_login">
			<c:if test="${sessionScope.MB_id == null }">
				<a>회원가입</a>
				<a href="loginForm.do">로그인</a>
			</c:if>
			<c:if test="${sessionScope.MB_id != null }">
				<c:if test="${sessionScope.MB_id == 'admin'}">
					<span><a href="main.do">메인 페이지</a></span>
				</c:if>
				<a href="logout.do">로그아웃</a>
			</c:if>
		</span>
	</div>
</body>
</html>