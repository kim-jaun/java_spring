<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#boardList').load('list.do','pageNum=${pageNum}&keyword=${board.keyword}&search=${board.search}');
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
		<a href="list.do?pageNum=${pageNum }"  class="btn btn-info">게시글 목록</a>
		<a href="updateForm.do?num=${board.num}&pageNum=${pageNum }"  
			class="btn btn-warning">수정</a>
		<a href="deleteForm.do?num=${board.num}&pageNum=${pageNum }" 
			 class="btn btn-danger">삭제</a>
		<a href="insertForm.do?num=${board.num}&pageNum=${pageNum }"  
			class="btn btn-success">답변글</a>
	</td></tr>
</table>
<div id="boardList"></div>
</div>
</body>
</html>