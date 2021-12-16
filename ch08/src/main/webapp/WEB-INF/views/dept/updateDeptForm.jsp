<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<div class="container" align="center">
	<h1 class="text-primary">부서정보 수정</h1>
<form action="deptUpdate.do" name="frm" method="post">
	<input type="hidden" name="deptno" value="${dept.deptno }">
<table class="table table-bordered">
	<tr><td>부서코드</td><td>${dept.deptno }</td></tr>
	<tr><th>부서명</th><td><input type="text" name="dname" required="required"
		autofocus="autofocus" value="${dept.dname }"></td></tr>
	<tr><th>근무지</th><td><input type="text" name="loc" required="required"
		value="${dept.loc }"></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="확인" class="btn btn-success"></td></tr>
</table>
</form>
<a class="btn btn-info" href="deptList.do">부서목록</a>
</div>
</body>
</html>