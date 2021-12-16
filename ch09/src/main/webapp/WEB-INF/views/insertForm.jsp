<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.password.value !=frm.password2.value) {
			alert("암호와 암호확인이 다릅니다");   frm.password.value="";
			frm.password.focus(); 			return false;
		}
	}
</script></head><body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 입력</h2>
<form action="insert.do" method="post" name="frm" onsubmit="return chk()">
	<input type="hidden" name="num" value="${num }">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="ref" value="${ref}">
	<input type="hidden" name="re_level" value="${re_level}">
	<input type="hidden" name="re_step" value="${re_step}">
<table class="table table-bordered">
	<c:if test="${num == 0 }">
		<tr><th>제목</th><td><input type="text" name="subject" required="required"
			autofocus="autofocus"></td></tr>
	</c:if>
	<c:if test="${num != 0 }">
		<tr><th>제목</th><td><input type="text" name="subject" required="required"
			autofocus="autofocus" value="답변 ) "></td></tr>
	</c:if>
<!-- 	회원 게시판에서는 id나 회원 이름으로 대체
	회원게시판에서는 회원 정보에 있으므로 생략하고 회원만 입력/수정/삭제가 가능하고 비회원은 조회만 -->
	<tr><th>작성자</th><td><input type="text" name="writer" required="required"></td></tr>
	<tr><th>이메일</th><td><input type="email" name="email" required="required"></td></tr>
	<tr><th>암호</th><td><input type="password" name="password" required="required"></td></tr>
	<tr><th>암호확인</th><td><input type="password" name="password2" required="required"></td></tr>
<!-- 	여기까지는 회원 게시판에서는 필요 없는 부분 -->
	<tr><th>내용</th><td><textarea rows="5" cols="40" name="content"
		required="required"></textarea></td></tr>
	<tr><td align="center" colspan="2"><input type="submit" value="확인" 
		class="btn btn-warning"></td></tr>	
</table>
</form>
</div>
</body>
</html>