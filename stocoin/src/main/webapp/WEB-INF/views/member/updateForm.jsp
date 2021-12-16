<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="ss" class="com.sc.stocoin.model.StocoinStrings" scope="page" />
<!DOCTYPE html>
<html>
<head>
<style>
	.container.update {
		margin-top: 0;
		margin-bottom: 0;
	}
	
	.updateBox {
		display: flex;
		align-items: center;
	}
	
	input[type="button"] {
		height: 39px;
	}
	
	input[type="text"] {
		margin-right: 8px;
		margin-bottom: 6px;
	}
</style>
<script type="text/javascript">
	function del() {
		location.href = "https://kauth.kakao.com/oauth/authorize?client_id=8d7498ce8ee97c514f96feb042750e1e&redirect_uri=http://${ss.getIP()}/stocoin/delete&response_type=code";
	}
	
	function nickChk() {
		if (frm.nick.value == "") {
			alert("닉네임을 입력하세요")
			frm.nick.focus();
			frm.nick.value = "";
			return false;
		} else {
			$.post('/stocoin/member/nickChk', 'nick=' + frm.nick.value, function(data) {
				$('#nickChk').html(data);
			});
		}
	}
</script>
</head>
<body>
	<div class="container col-5 update">
		<div class="row align-items-center">
			<h2 class="title" align="center">회원 정보 수정</h2>
		</div>
		<form action="/stocoin/member/update" method="post" name="frm">
			<input type="hidden" name="id" value="${member.id}">
			<label for="nick" class="col-sm-2 col-form-label">닉네임</label>
			<div class="updateBox">
				<input type="text" name="nick" id="nick" value="${nick}" required>
				<input type="button" onclick="nickChk()" class="btn btn-sm btn-outline-primary" value="중복체크" required="required">
			</div>
			<div id="nickChk" class="err text-warning"></div>
			<div class="input_box center">
				<input class="btn btn-primary col-3" type="submit" value="수정">
				<input class="btn btn-outline-primary col-3" type="button" onclick="history.back()" value="취소">
				<input class="btn btn-outline-primary col-3" type="button" onclick="del()" value="탈퇴">
			</div>
		</form>
	</div>
</body>
</html>