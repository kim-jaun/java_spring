<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		// 현재 게시글에 해당하는 댓글을 가져와서 보여줘라
		$('#rbdListDisp').load('${path}/replyList/bno/${board.num}');
		$('#boardList').load('${path}/list/pageNum/${pageNum}?keyword=${board.keyword}&search=${board.search}');
		$('#rInsert').click(function() {
/* 			var sendData="bno="+frm1.bno.value+"&replyer="+
				frm1.replyer.value+"&replytext="+frm1.replytext.value; */
			var sendData = $('#frm1').serialize();
			$.post('${path}/rInsert',sendData, function(data) {
				alert("댓글이 작성 되었습니다");	
				$('#rbdListDisp').html(data);
				frm1.replytext.value="";  // 작성했던 댓글 삭제
			});
		});
	});
</script></head><body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 상세 조회</h2>
<table class="table table-striped">
	<tr><th>제목</th><td>${board.subject}</td></tr>
	<tr><th>작성자</th><td>${board.writer}</td></tr>
	<tr><th>이메일</th><td>${board.email}</td></tr>
	<tr><th>조회수</th><td>${board.readcount}</td></tr>
	<tr><th>작성일</th><td>${board.reg_date}</td></tr>
	<tr><th>내용</th><td>${board.content}</td></tr>
	<tr><td colspan="2">
		<a href="${path}/list/pageNum/${pageNum }"  class="btn btn-info">게시글 목록</a>
		<a href="${path}/updateForm/num/${board.num}/pageNum/${pageNum }"  
			class="btn btn-warning">수정</a>
		<!-- 회원게시판은 삭제하시겠습니다, 문의하고 deleteForm없이 바로 삭제 -->
		<a href="${path}/deleteForm/num/${board.num}/pageNum/${pageNum }" 
			 class="btn btn-danger">삭제</a>
		<a href="${path}/insertForm/num/${board.num}/pageNum/${pageNum }"  
			class="btn btn-success">답변글</a>
	</td></tr>
</table>
<h2 class="text-primary">댓글 작성</h2>
<!-- submit할 때 action이 없는 경우에는 자신(여기서는 view)를 한번 더 실행 -->
<form action="" id="frm1" name="frm1">
	<input type="hidden" name="bno" value="${board.num}">
<table class="table table-hover">
	<!-- 회원 게시판의 경우에는 회원이름 또는 회원별명 또는 화원 id -->
	<tr><th>작성자</th><td><input type="text" name="replyer" 
		value="${board.writer}"></td>
		<th>댓글</th><td><textarea rows="3" cols="30" name="replytext"></textarea></td>
		<td><input type="button" value="댓글 입력" id="rInsert"
			class="btn btn-sm btn-info"></td></tr>
</table>	
</form>
<div id="rbdListDisp"></div>
<div id="boardList"></div>
</div>
</body>
</html>