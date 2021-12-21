<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function deptNoCHk() {
		if (!frm.deptno.value) {
			alert("부서코드 입력한 후에 체므하시오");
			frm.deptno.focus(); return false;
		}
		$.post('deptNoChk.do',"deptno="+frm.deptno.value, function(data) {
			$('#deptChk1').html(data);
		});
	}
</script></head><body>
<div class="container" align="center">
	<h1 class="text-primary">부서정보 입력</h1>
<form action="deptInsert.do" name="frm" method="post">
<table class="table table-bordered">
	<tr><td>부서코드</td><td><input type="number" name="deptno" required="required"
		autofocus="autofocus" max="99"> <input type="button" value="중복체크" 
		onclick="deptNoCHk()" class="btn btn-warning btn-sm">
		<div id="deptChk1" class="err"></div></td></tr>
	<tr><th>부서명</th><td><input type="text" name="dname" required="required"></td></tr>
	<tr><th>근무지</th><td><input type="text" name="loc" required="required"></td></tr>
	<tr><td colspan="2" align="center">
		<input type="submit" value="확인" class="btn btn-success"></td></tr>
</table>
</form>
<a class="btn btn-info" href="deptList.do">부서목록</a>
</div>
</body>
</html>