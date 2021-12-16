package com.ch.ch11;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatSocketHandler extends TextWebSocketHandler {
	// 접속한 클라이언트를 저장할 객체
	private Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
	// 연결 됐을 때 : 연결된 정보(클라이언트)를 map에 저장
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		 users.put(session.getId(), session);
	}
	// 연결이 해지되면 : 연결된 정보를 삭제
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session.getId());
	}
	// 메세지가 왔을 때 : 연결된 모든 클라이언트에 메세지 전달
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		Collection<WebSocketSession> sessions = users.values();
		for (WebSocketSession ws : sessions) {
			ws.sendMessage(message);
		}
	}
}