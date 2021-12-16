<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div class="container" align="center">
<form action="review">
<table class="table table-striped">
	<tr><td>이름</td><td>${editCustomer.name }</td></tr>
	<tr><td>주소</td><td>${editCustomer.address}</td></tr>
	<tr><td>이메일</td><td>${editCustomer.email}</td></tr>
	<tr><td colspan="2">
		<button type="submit" name="event_confirm">확인</button>
		<button type="submit" name="event_cancel">취소</button>
	</td></tr>
</table></form>
</div>
</body>
</html>