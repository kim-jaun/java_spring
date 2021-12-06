<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div class="container" align="center">
<form action="member" method="post">
	<h2>회원 가입</h2>
<table class="table table-striped">
	<tr><td>이름</td><td><input type="text" name="name" required="required"
		autofocus="autofocus"></td></tr>
	<tr><td>주소</td><td><input type="text" name="addr" required="required"></td></tr>
	<tr><td>나이</td><td><input type="number" name="age" required="required"></td></tr>
	<tr><td>성별</td><td><label for="g1">남자</label>
		<input type="radio" name="gender" id="g1" checked="checked" value="남자"><br>
		<label for="g2">여자</label>
		<input type="radio" name="gender" id="g2" value="여자"></td></tr>
	<tr><td>취미</td><td><select name="hobby">
			<option>게임<option>음주<option>가무<option>울기<option>졸기<option>싸우기
		</select></td></tr>
	<tr align="center"><td colspan="2"><input type="submit" class="btn btn-danger"></td></tr>	
	</table></form>
</div>
</body>
</html>