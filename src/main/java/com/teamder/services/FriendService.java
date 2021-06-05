package com.teamder.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamder.models.Friend;
import com.teamder.repositories.FriendRepository;

public class FriendService implements GenericService<Friend> {

	@Autowired
	private FriendRepository friend;
	
	/**
	 * CRUD pour Friend
	 */
	
	@Override
	public List<Friend> getAll() {
		
		return this.friend.findAll();
	}

	@Override
	public Friend getById(Long id) {
		
		return this.friend.findById(id).get();
	}

	@Override
	public Friend save(Friend friend) {
		
		return this.friend.save(friend);
	}

	@Override
	public Friend update(Friend friend) {
		
		return this.friend.save(friend);
	}

	@Override
	public void deleteById(Long id) {
		
		this.friend.deleteById(id);
		
	}
	
	/**
	 * Fin CRUD pour Friend
	 */
}
