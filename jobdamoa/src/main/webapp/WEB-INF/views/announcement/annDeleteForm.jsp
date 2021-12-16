<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if(!frm.com_password.value) {
			alert("비밀번호를 입력해야 합니다.");
			frm.com_password.focus();
			return false;
		}
		else if(frm.com_password.value){
		$.ajax({
	        type: "POST",
	        url: "confirmAnnDel.do?com_password=" + frm.com_password.value,
	        async: false,
	        contentType: "application/json; charset=utf-8",
	        success: function (result) {
	        	if (result == "1") {
					delchk = confirm("정말로 공고를 삭제하시겠습니까?");
					if (delchk) {
						//return true;
						frm.action="annDelete.do";
						frm.submit();
					} else {
						return;		
					}
				} else if (result == "-1") {
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
	        }
	    });
		}
	}
	function chk2() {
		if(!frm.manager_password.value) {
			alert("비밀번호를 입력해야 합니다.");
			frm.manager_password.focus();
			return false;
		}
		else if(frm.manager_password.value) {
		$.ajax({
	        type: "POST",
	        url: "confirmAnnDelManager.do?manager_password=" + frm.manager_password.value,
	        async: false,
	        contentType: "application/json; charset=utf-8",
	        success: function (result) {
	        	if (result == "2") {
					delchk = confirm("정말로 공고를 삭제하시겠습니까?");
					if (delchk) {
						//return true;
						frm.action="annDelete.do";
						frm.submit();
					} else {
						return;		
					}
				} else if (result == "-1") {
					alert("비밀번호가 일치하지 않습니다.");
					return;
					}
	        	}
	    	});
		}
	}
</script>
</head>
<body>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("중지된 공고는 삭제할 수 없습니다.");
		location.href=history.go(-1);
	</script>	
</c:if>
<c:if test="${result == 1 }">
	<c:if test="${user_dist == 1 }">
		<div class="container" align="center">
		<form action="" name="frm" method="post" onsubmit="return chk(this);">
			<input type="hidden" name="ann_num" value="${ann_num }">
				<div class="card w-100 text-center">
					<div class="card-body">
						<h6>회원님의 계정 비밀번호를 입력하세요.</h6>
						<div class="form-floating mb-3">
							<input type="password" name="com_password" class="form-control"
								id="com_password" placeholder="Password"> <label
								for="com_password">Password</label>
						</div>
					</div>
					<div class="card-footer">
						<input type="submit" class="btn btn-primary" value="확인">
						<input type="button" class="btn btn-danger" onclick="history.back();" value="취소">
					</div>
				</div>
			</form>
		</div>
	</c:if>
</c:if>
<c:if test="${result == 2 }">
	<c:if test="${user_dist == 2}">
		<div class="container" align="center">
			<form action="" name="frm" method="post" onsubmit="return chk2(this);">
			<input type="hidden" name="ann_num" value="${ann_num }">
				<div class="card w-100 text-center">
					<div class="card-body">
						<h6>관리자 비밀번호를 입력하세요.</h6>
						<div class="form-floating mb-3">
							<input type="password" name="manager_password" class="form-control"
								id="manager_password" placeholder="Password"> <label
								for="manager_password">Password</label>
						</div>
					</div>
					<div class="card-footer">
						<input type="submit" class="btn btn-primary" value="확인">
						<input type="button" class="btn btn-danger" onclick="history.back();" value="취소">
					</div>
				</div>
			</form>
		</div>
	</c:if>
</c:if>
</body>
</html>