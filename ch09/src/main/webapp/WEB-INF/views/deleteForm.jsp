<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 삭제 확인</h2>
<form action="delete.do" method="post">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="num" value="${num }">
<table class="table table-bordered">
	<tr><th>암호</th><td><input type="password" name="password" 
		required="required" autofocus="autofocus"></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="확인" class="btn btn-danger"></td></tr>
</table>
</form>
</div>
</body>
</html>