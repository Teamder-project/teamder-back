package com.teamder.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.teamder.models.FriendRequest;
import com.teamder.services.GenericService;

@RestController
@RequestMapping("friend-requests")
public class FriendRequestController {

	@Autowired
	private GenericService<FriendRequest> service;
	
	/**
	 * CRUD pour FriendRequest
	 */
	
	@GetMapping()
	public List<FriendRequest> getFriendRequests() {
		return this.service.getAll();
	}
	
	@GetMapping("{id}")
	public FriendRequest getFriendRequestById(@PathVariable Long id) {
		return this.service.getById(id);
	}
	
	@PostMapping()
	public FriendRequest saveFriendRequest(@RequestBody FriendRequest friendRequest) {
		return this.service.save(friendRequest);
	}
	
	@PatchMapping()
	public FriendRequest updateFriendRequest(@RequestBody FriendRequest friendRequest) {
		return this.service.save(friendRequest);
	}
	
	@DeleteMapping("{id}")
	public void deleteById(@PathVariable Long id) {
		this.service.deleteById(id);
	}
	
	/**
	 * Fin du CRUD pour FriendRequest
	 */
}