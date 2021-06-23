package com.teamder.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamder.models.FriendChat;
import com.teamder.repositories.FriendChatRepository;
import com.teamder.services.interfaces.GenericService;

public class FriendChatService implements GenericService<FriendChat> {

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
	
	/**
	 * Fin du CRUD pour FriendChat
	 */
	
}
