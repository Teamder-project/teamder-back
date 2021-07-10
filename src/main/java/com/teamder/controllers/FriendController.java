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

import com.teamder.models.Friend;
import com.teamder.models.Gamer;
import com.teamder.services.interfaces.FriendInterface;

@RestController
@RequestMapping("friends")
public class FriendController {

	@Autowired
	private FriendInterface service;
	
	/**
	 * CRUD pour Friend
	 */
	
	@GetMapping()
	public List<Friend> getFriends() {
		return this.service.getAll();
	}
	
	@GetMapping("{id}")
	public Friend getFriendById(@PathVariable Long id) {
		return this.service.getById(id);
	}
	
	@GetMapping("gamer/{id}")
	public List<Gamer> getGamersByGamerId(@PathVariable Long id) {
		return this.service.getGamersByGamerId(id);
	}
	
	@PostMapping()
	public Friend saveFriend(@RequestBody Friend friend) {
		return this.service.save(friend);
	}
	
	@PatchMapping()
	public Friend updateFriend(@RequestBody Friend friend) {
		return this.service.save(friend);
	}
	
	@DeleteMapping("{id}")
	public void deleteById(@PathVariable Long id) {
		this.service.deleteById(id);
	}
	
	/**
	 * Fin du CRUD pour Friend
	 */
}