<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div class="container" align="center">
	<h2 class="primary-text">부서 목록</h2>
	<!-- table-bordered 테이블 칸을 박스로 구현 -->
<table class="table table-hover table-bordered">
	<tr><th>부서코드</th><th>부서명</th><th>근무지</th></tr>
<c:forEach var="dept" items="${list }">
	<tr><td>${dept.deptno }</td>
		<td><a href="deptDetail.do?deptno=${dept.deptno }"
			class="btn btn-success btn-sm">${dept.dname }</a></td>
		<td>${dept.loc }</td></tr>
</c:forEach>
</table>
</div>
</body>
</html>