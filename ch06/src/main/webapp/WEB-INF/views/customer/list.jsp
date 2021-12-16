<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div class="container" align="center">
	<h2 class="text-primary">회원 목록</h2>
<table class="table table-bordered table-hover">
	<tr><td>아이디</td><td>이름</td><td>주소</td><td>이메일</td>
		<td>상세</td><td>편집</td></tr>
<c:forEach var="customer" items="${customers }">
	<tr><td>${customer.id }</td>
		<td>${customer.name }</td>
		<td>${customer.address }</td>
		<td>${customer.email }</td>
		<%-- customer/${customer.id}는 REST방식으로 customer/?id=${customer.id }와 유사 --%>
		<!-- /는 html에서는 ip:포트 다음을 가르키고
			 jsp 또는 java에서는 /는 ip:포트/프로젝트 다음을 가르킨다 -->
		<%-- <td><a href="${path}/customer/${customer.id}">상세</a></td> --%>
		<td><c:url var="url" value="/customer/${customer.id}"></c:url>
			<a href="${url }" class="btn btn-info btn-sm">상세</a></td>
		<td><a href="${path }/customer/${customer.id}/edit" 
			class="btn btn-warning btn-sm">편집</a></td></tr>
</c:forEach>
</table></div></body></html>