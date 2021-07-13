package com.teamder.services;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamder.models.FriendChat;
import com.teamder.repositories.FriendChatRepository;
import com.teamder.services.interfaces.FriendChatInterface;


public class FriendChatService implements FriendChatInterface {

	@Autowired
	private FriendChatRepository friendChat;
	
	/**
	 * CRUD pour FriendChat
	 */
	
	@Override
	public List<FriendChat> getAll() {
		
		return this.friendChat.findAll();
	}

	@Override
	public FriendChat getById(Long id) {
		
		return this.friendChat.findById(id).get();
	}

	@Override
	public FriendChat save(FriendChat friendChat) {
		String InstantDateTimeMessage = LocalDateTime.now().toString();
		friendChat.setTime(InstantDateTimeMessage);
		return this.friendChat.save(friendChat);
	}

	@Override
	public FriendChat update(FriendChat friendChat) {
		
		return this.friendChat.save(friendChat);
	}

	@Override
	public void deleteById(Long id) {
		
		this.friendChat.deleteById(id);
		
	}

	@Override
	public List<FriendChat> getMessagesBySenderAndReceiver(Long idSender, Long idReceiver) {
		return friendChat.getMessagesBySenderAndReceiver(idSender, idReceiver);
	}
	
	/**
	 * Fin du CRUD pour FriendChat
	 */

	
}
