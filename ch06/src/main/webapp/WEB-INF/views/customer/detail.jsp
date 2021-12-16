<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del() {
		var val = confirm("정말로 삭제 하시겠습니까 ?");
		if (val) location.href="${path}/delete/${customer.id}";
		else alert("삭제가 취소 되었습니다");
	}
</script>
</head><body>
<div class="container" align="center">
	<h2 class="text-primary">고객 상세정보</h2>
<table class="table table-striped table-bordered">
	<tr><td>아이디</td><td>${customer.id }</td></tr>
	<tr><td>이름</td><td>${customer.name }</td></tr>
	<tr><td>주소</td><td>${customer.address}</td></tr>
	<tr><td>이메일</td><td>${customer.email}</td></tr>
	<tr><td colspan="2" align="center"><a class="btn btn-info" href="${path}/customer">목록</a>
		<button class="btn btn-danger" onclick="del()">삭제</button> </td></tr>
</table>
</div>
</body>
</html>