package com.teamder.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamder.models.FriendGame;
import com.teamder.repositories.FriendGameRepository;
import com.teamder.services.interfaces.GenericService;

public class FriendGameService implements GenericService<FriendGame> {

	@Autowired
	private FriendGameRepository friendGame;
	
	/**
	 * CRUD pour FriendGame
	 */
	
	@Override
	public List<FriendGame> getAll() {
		
		return this.friendGame.findAll();
	}

	@Override
	public FriendGame getById(Long id) {
		
		return this.friendGame.findById(id).get();
	}

	@Override
	public FriendGame save(FriendGame friendGame) {
		
		return this.friendGame.save(friendGame);
	}

	@Override
	public FriendGame update(FriendGame friendGame) {
		
		return this.friendGame.save(friendGame);
	}

	@Override
	public void deleteById(Long id) {
		
		this.friendGame.deleteById(id);
		
	}
	
	/**
	 * Fin du CRUD pour FriendGame
	 */
}
