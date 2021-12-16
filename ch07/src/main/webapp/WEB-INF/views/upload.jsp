<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div class="container" align="center">
	<h2 class="text-primary">업로드 결과</h2>
<table class="table table-striped">
	<tr><td>아이디</td><td>${member.id }</td></tr>
	<tr><td>이름</td><td>${member.name}</td></tr>
	<tr><td>파일명</td><td>${fileName}</td></tr>
	<tr><td>파일크기</td><td>${fileSize}</td></tr>
	<tr><td>사진</td><td><img alt="${fileName }" 
		src="resources/upload/${fileName }" width="300"> </td></tr>
</table>
</div>
</body>
</html>