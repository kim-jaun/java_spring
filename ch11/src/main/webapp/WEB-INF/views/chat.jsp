<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table { 
		height: 450px; 
		border: 2px solid green;
		table-layout: fixed; 
		overflow: hidden;	
	}
	#chatMessage { 
		height: 400px; 
		overflow: scroll; 
	}
</style>
<script type="text/javascript">
	var websocket;	// 전역변수, 여러 function에 사용
	var nickname;
	$(function() {
		$('#enterBtn').click(function() {
			connect();
		});
		$('#exitBtn').click(function() {
			disconnect();
		});
		$('#sendBtn').click(function() {
			send();
		});
		// keypress - 키보드를 눌렀을 때
		$('#message').keypress(function() {
			// 누른 key ascii값 	IE이면?	IE의 key값	  IE가 아닌 key값 
			var keycode = event.keyCode?event.keyCode:event.which;
			if (keycode == 13) { // ascii 값으로 13은 enter
				send();
			}
		});
	});
	function connect() {
		websocket = new WebSocket("ws://172.30.1.47:8080/ch11/chat-ws.do");
		websocket.onopen = Open;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
	}
	function disconnect() {
		websocket.close();
	}
	function send() {
		var msg = $('#message').val();	// 메세지에 입력한 글 읽기
		websocket.send(nickname + " => " + msg);	// 메세지를 별명과 함께 전송
		$('#message').val("");	// 메세지에 입력한 글 지우기
	}
	function Open() {
		nickname = $('#nickname').val(); // 별명 가져오기
		appendMessage(nickname + "님이 입장하였습니다.");
	}
	function onClose() {
		appendMessage(nickname + "님이 퇴장하였습니다.");
	}
	function onMessage(event) {
		var msg = event.data;	// 메세지는 event의 data속성에 값으로 들어온다.
		appendMessage(msg);
	}
	function appendMessage(msg) {
		$('#chatMessage').append(msg + "<br>");	// 메세지 붙이고 줄바꿈
		var objDiv = document.getElementById("chatMessage");
		// 채팅창에 글이 가득 차면 scoll bar를 항상 상단으로 고정
		objDiv.scrollTop = objDiv.scrollHeight;
	}
</script>
</head>
<body>
	<div class="container">
		<table class="table table-hover">
			<tr>
				<td width="20%">별명</td>
				<td>
					<input type="text" id="nickname">
					<input type="button" id="enterBtn" value="입장" class="btn btn-info btn-sm">
					<input type="text" id="exitBtn" value="퇴장" class="btn btn-warning btn-sm">
				</td>
			</tr>
			<tr>
				<td>메세지</td>
				<td>
					<input type="text" id="message">
					<input type="button" id="sendBtn" value="전송" class="btn btn-sm btn-success">
				</td>
			</tr>
			<tr>
				<td>대화연결</td>
				<td>
					<div id="chatMessage"></div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>