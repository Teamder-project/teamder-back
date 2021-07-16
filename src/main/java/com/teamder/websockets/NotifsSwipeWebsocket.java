package com.teamder.websockets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

import com.teamder.websockets.coders.GamerDecoder;
import com.teamder.websockets.coders.GamerEncoder;

@Component
@ServerEndpoint(value = "/notifsSwipe/{id}", decoders = GamerDecoder.class, encoders = GamerEncoder.class)
public class NotifsSwipeWebsocket {
	private Session session;
	private Long id;
	private static final Set<NotifsSwipeWebsocket> chatEndpoints = new CopyOnWriteArraySet<>();
	public static HashMap<Long, Session> sessions = new HashMap<>();

	@OnOpen
	public void onOpen(Session session, @PathParam("id") Long id) throws IOException, EncodeException {
		this.session = session;
		this.id = id;
		chatEndpoints.add(this);
		sessions.put(id, session);
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