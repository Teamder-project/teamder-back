package com.teamder.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamder.models.Friend;
import com.teamder.models.Gamer;
import com.teamder.repositories.FriendRepository;
import com.teamder.services.interfaces.FriendInterface;
import com.teamder.services.interfaces.GenericService;

public class FriendService implements FriendInterface {

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

	@Override
	public List<Gamer> getGamersByGamerId(Long idGamer) {
		List<Gamer> liste = new ArrayList<Gamer>();
		for(Friend friend : this.friend.getGamersByGamer(idGamer)) {
			liste.add(friend.getGamer2());
		};
		for(Friend friend : this.friend.getGamersByGamerBis(idGamer)) {
			liste.add(friend.getGamer1());
		};
		return liste;
	}
	
	/**
	 * Fin CRUD pour Friend
	 */

	
	
}
