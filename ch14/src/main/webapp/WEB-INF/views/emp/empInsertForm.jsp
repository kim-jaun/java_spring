<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function empnoChk() {
		if (!frm.empno.value) {	alert("사번을 입력하고 체크하시오");
			frm.empno.focus();	return false;
		}
		$.post('empnoChk.do', 'empno='+frm.empno.value, function(data) {
			$('#empnoChk1').html(data);
		});
	}
</script></head><body>
<div class="container" align="center">
	<h2 class="text-primary">직원정보 입력</h2>
<form action="empInsert.do" method="post" name="frm">
<table class="table table-bordered">
	<tr><th>사번</th><td><input type="number" name="empno" required="required"
		autofocus="autofocus"> <input type="button" value="중복체크" 
		onclick="empnoChk()" class="btn btn-warning btn-sm">
		<div id="empnoChk1" class="err"></div></td></tr>
	<tr><th>이름</th><td><input type="text" name="ename" required="required"></td></tr>
	<tr><th>업무</th><td><input type="text" name="job" required="required"></td></tr>
	<tr><th>관리자 사번</th><td><select name="mgr">
		<c:forEach var="emp" items="${empList }">
			<option value="${emp.empno }">${emp.ename}(${emp.empno})</option>
		</c:forEach>
	</select></td></tr>
	<tr><th>입사일</th><td><input type="date" name="hiredate" required="required"></td></tr>
	<tr><th>급여</th><td><input type="number" name="sal" required="required"></td></tr>
	<tr><th>커미션</th><td><input type="number" name="comm" required="required"></td></tr>
	<tr><th>부서코드</th><td><select name="deptno">
		<c:forEach var="dept" items="${deptList }">
			<c:if test="${dept.deptno==deptno }">
				<option value="${dept.deptno }" selected="selected">${dept.dname}(${dept.deptno})</option>
			</c:if>
			<c:if test="${dept.deptno!=deptno }">
				<option value="${dept.deptno }">${dept.dname}(${dept.deptno})</option>
			</c:if>
		</c:forEach>
	</select></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="확인" class="btn btn-danger"></td></tr>
</table>
</form>
</div>
</body>
</html>