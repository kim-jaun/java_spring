<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("로그인 성공");
	</script>
	<a href="uploadForm.do" class="btn btn-success">업로드</a><p>
	<a href="uploadForm3.do" class="btn btn-danger">업로드3</a><p>
	<a href="logout.do" class="btn btn-warning">로그아웃</a>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("로그인 실패");
		history.back();
	</script>	
</c:if>
</body>
</html>