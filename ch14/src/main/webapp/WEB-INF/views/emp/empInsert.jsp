<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("와우 성공 !!");
		location.href="empSelect.do?empno=${emp.empno}";
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("헐 ~ 실패 !!");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == -1}">
	<script type="text/javascript">
		alert("있는 데이터 있라고 했는데,  왜 또 !!헐 ~");
		history.go(-1);
	</script>
</c:if>
</body>
</html>