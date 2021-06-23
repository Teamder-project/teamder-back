package com.teamder.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamder.models.FriendRequest;
import com.teamder.repositories.FriendRequestRepository;
import com.teamder.services.interfaces.GenericService;

public class FriendRequestService implements GenericService<FriendRequest> {

	@Autowired
	private FriendRequestRepository friendRequest;
	
	/**
	 * CRUD pour FriendRequest
	 */
	
	@Override
	public List<FriendRequest> getAll() {
		
		return this.friendRequest.findAll();
	}

	@Override
	public FriendRequest getById(Long id) {
		
		return this.friendRequest.findById(id).get();
	}

	@Override
	public FriendRequest save(FriendRequest friendRequest) {
		
		return this.friendRequest.save(friendRequest);
	}

	@Override
	public FriendRequest update(FriendRequest friendRequest) {
		
		return this.friendRequest.save(friendRequest);
	}

	@Override
	public void deleteById(Long id) {
		
		this.friendRequest.deleteById(id);
		
	}
	
	/**
	 * Fin du CRUD pour FriendRequest
	 */
}
