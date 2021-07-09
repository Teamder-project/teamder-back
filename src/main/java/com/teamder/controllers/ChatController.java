package com.teamder.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

import com.teamder.config.MessageDecoder;
import com.teamder.config.MessageEncoder;
import com.teamder.models.FriendChat;

@Component
@ServerEndpoint(value = "/chat/{id}", decoders = MessageDecoder.class, encoders = MessageEncoder.class)
public class ChatController {
	private Session session;
	private Long id;
	private static final Set<ChatController> chatEndpoints = new CopyOnWriteArraySet<>();
	private static HashMap<Long, Session> sessions = new HashMap<>();

	@OnOpen
	public void onOpen(Session session, @PathParam("id") Long id) throws IOException, EncodeException {
		this.session = session;
		this.id = id;
		chatEndpoints.add(this);
		sessions.put(id, session);
	}

	@OnMessage
	public void onMessage(Session session, FriendChat message) throws IOException, EncodeException {
		session.getBasicRemote().sendObject(message);
		if(ChatController.sessions.get(message.getReceiver().getId()) != null) {
			ChatController.sessions.get(message.getReceiver().getId()).getBasicRemote().sendObject(message);
		}
	}

	@OnClose
	public void onClose(Session session) throws IOException, EncodeException {
		chatEndpoints.remove(this);
		sessions.remove(id);
	}

	@OnError
	public void onError(Session session, Throwable throwable) {
		System.out.println("Erreur");
	}
}