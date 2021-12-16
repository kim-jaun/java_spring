<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<body>
<h2 class="title">드라이버 신청 목록</h2>
	<div class="searchDIV">
		<form action="adminPermitList.do">
		<input type="hidden" name="pageNum" value="1">
		<select name="search" class="inputUnderLine">
			<c:forTokens var="sh" items="MB_id,MB_name,MB_gender,MB_driverConfirm" delims="," varStatus="i">
				<c:if test="${sh == apply.search }">
					<option value="${sh}" selected="selected">${title[i.index] }</option>
				</c:if>
				<c:if test="${sh != apply.search }">
					<option value="${sh}">${title[i.index] }</option>
				</c:if>
			</c:forTokens>
		</select>
			<!-- 수정 필요 -->
			<input type="text" name="keyword" value="${apply.keyword }" class="inputUnderLine">
			<input type="submit" value="검색" class="btn_search">
		</form>
	</div>
		<table class="table">
			<tr>
				<th class="col-md-2 text-center">신청번호</th>
				<th class="col-md-5 text-center">회원 ID</th>
				<th class="col-md-2 text-center">이름</th>
				<th class="col-md-1 text-center">성별</th>
				<th class="col-md-2 text-center">승인상태</th>		
			</tr>
			<c:if test="${empty applyList }">
				<tr>
					<th colspan="5" class="text-center">드라이버 신청 정보가 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty applyList }">
				<c:forEach var="apply" items="${applyList }">
					<%-- <c:if test="${apply.MB_driverConfirm == 'I'}"> --%>
					<tr>
						<td class="col-md-2 text-center">${num }<c:set var="num" value="${num -1 }"></c:set></td>
						<!-- 게시글 번호 순서 정렬 -->
							<td class="col-md-5 text-center">
								<a href="adminPermitView.do?MB_num=${apply.MB_num }&pageNum=${pb.currentPage}" class="inputLineA">${apply.MB_id }</a></td>
							<td class="col-md-2 text-center">${apply.MB_name }</td>
							<c:if test="${apply.MB_gender == 1 || apply.MB_gender == 3}">
								<td class="col-md-1 text-center">남자</td>
							</c:if>
							<c:if test="${apply.MB_gender == 2 || apply.MB_gender == 4}">
								<td class="col-md-1 text-center">여자</td>
							</c:if>
							<c:if test="${apply.MB_driverConfirm == 'I' }">
								<td class="col-md-2 text-center">심사중
							</c:if>
							<c:if test="${apply.MB_driverConfirm == 'N' }">
								<td class="col-md-2 text-center">반려</td>
							</c:if>  
							<c:if test="${apply.MB_driverConfirm == 'Y' }">
								<td class="col-md-2 text-center">		
								<img alt="" src="${path }/resources/main/check.png" 
										width="15px" height="15px"></td>
							</c:if>
					
					<%-- </c:if> --%>
				</c:forEach>
				<tr><td colspan="5"></td></tr>
			</c:if>
		</table>
		<div align="center">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li>
						<a href="adminPermitList.do?pageNum=1&search=${apply.search }&keyword=${apply.keyword }"
							class="page_num"><span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li><a href="adminPermitList.do?pageNum=${pb.startPage - 1 }&search=${apply.search }&keyword=${apply.keyword }"
							class="page_num"><span class="glyphicon glyphicon-triangle-left"></span>
						</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li><a href="adminPermitList.do?pageNum=${i }&search=${apply.search }&keyword=${apply.keyword }"
							class="page_num">ㅤ${i}ㅤ</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="adminPermitList.do?pageNum=${i }&search=${apply.search }&keyword=${apply.keyword }"
							class="page_num">ㅤ${i}ㅤ</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="adminPermitList.do?pageNum=${pb.endPage + 1 }&search=${apply.search }&keyword=${apply.keyword }"
						class="page_num"><span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminPermitList.do?pageNum=${pb.totalPage }&search=${apply.search }&keyword=${apply.keyword }"
						class="page_num"><span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
</body>
</html>