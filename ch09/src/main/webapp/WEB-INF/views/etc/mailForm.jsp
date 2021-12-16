<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div class="container" align="center">
	<h2 class="text-primary">메일 작성</h2>
<form action="email.do">
<table class="table table-bordered">
	<tr><th>받는 사람</th><td><input type="email" name="email" 
		required="required" autofocus="autofocus"></td></tr>
	<tr><th>제목</th><td><input type="text" name="title" 
		required="required"></td></tr>
	<tr><th>내용</th><td><textarea rows="5" cols="40" 
		name="content" required="required"></textarea></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="메일 보내기" class="btn btn-warning"></td></tr>
</table></form>
</div>
</body>
</html>