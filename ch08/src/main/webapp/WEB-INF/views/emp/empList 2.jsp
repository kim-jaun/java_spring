<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#deptList').load("deptList.do table");
	});
</script></head><body>
<div class="container" align="center">
	<h2 class="text-primary">직원 목록</h2>
<table class="table table-striped">
	<tr><th>사번</th><th>이름</th><th>업무</th><th>입사일</th></tr>
<c:if test="${empty empList }">
	<tr><td colspan="4">직원이 없습니다</td></tr>
</c:if>
<c:if test="${not empty empList }">
	<c:forEach var="emp" items="${empList }">
		<tr><td>${emp.empno }</td>
			<td>${emp.ename }</td>
			<td>${emp.job }</td>
			<td>${emp.hiredate }</td></tr>
	</c:forEach>
</c:if>
</table>
<div id="deptList"></div>
</div>
</body>
</html>