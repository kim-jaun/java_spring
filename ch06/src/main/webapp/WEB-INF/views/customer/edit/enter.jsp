<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<!-- action값이 없으면 현재 action을 다시 실행 -->
<form:form modelAttribute="editCustomer" >
<table class="table table-hover"><caption>고잭정보 수정</caption>
	<tr><td>이름</td><td>
	<%--<input type="text" name="name" id="name" value="${editCustomer.name }">--%>
		<form:input path="name"/>
	<!-- 	cssClass class와 같음 name에 에러가 포함되어 있으면 보여줘라 -->
		<form:errors path="name" cssClass="err"></form:errors></td></tr>
	<tr><td>주소</td><td><form:input path="address"/>
		<form:errors path="address"></form:errors></td></tr>
	<tr><td>이메일</td><td><form:input path="email"/>
		<form:errors path="email"></form:errors></td></tr>
 <!-- 다음을 클릭하면  customer/id/enter를 다시 실행하는데 parameter에 event_process값을 전달 -->
 <tr><td colspan="2"><button type="submit" value="process"
		name="event_process">다음</button></td></tr>
</table>
</form:form>
</body>
</html>