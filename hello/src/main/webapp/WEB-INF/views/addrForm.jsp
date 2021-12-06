<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div class="container" align="center">
	<h2 class="text-primary">이름과 주소</h2>
<!-- <form action="addr"> -->
<!-- <form action="addr2"> -->
<form action="addr3">
<table class="table table-bordered">
	<tr><td>이름</td><td><input type="text" name="name" 
		required="required" autofocus="autofocus"></td></tr>
	<tr><td>주소</td><td><input type="text" name="addr" required="required"></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="확인"  class="btn btn-success"></td></tr>
</table>
</form>
</div>
</body>
</html>