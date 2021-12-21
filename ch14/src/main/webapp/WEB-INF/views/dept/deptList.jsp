<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del(deptno) {
		var cf = confirm("정말로 삭제하시겠습니까?");
		if (cf) location.href="deleteDept.do?deptno="+deptno;
		else alert("삭제가 취소 되었습니다");
	}
</script></head><body>
<div class="container" align="center">
	<h1 class="text-primary">부서 목록</h1>
<table class="table table-striped">
	<tr><th>부서코드</th><th>부서명</th><th>근무지</th><th>수정</th><th>삭제</th></tr>
<c:if test="${empty deptList }">
	<tr><th colspan="5">데이터가 없습니다</th></tr>
</c:if>
<c:if test="${not empty deptList }">
	<c:forEach var="dept" items="${deptList }">
		<tr><td>${dept.deptno }</td>
			<td><a class="btn btn-success btn-sm" 
				href="empList.do?deptno=${dept.deptno }">${dept.dname }</a></td>
			<td>${dept.loc }</td>
			<td><a class="btn btn-warning btn-sm" 
				href="updateDeptForm.do?deptno=${dept.deptno }">수정</a></td>
			<td><a class="btn btn-danger btn-sm" 
				onclick="del(${dept.deptno})">삭제</a></td></tr>
	</c:forEach>
</c:if></table>
<a class="btn btn-info" href="insertDeptForm.do">부서정보 입력</a>
<a class="btn btn-default" href="allEmpList.do">전 직원목록</a>
</div>
</body>
</html>