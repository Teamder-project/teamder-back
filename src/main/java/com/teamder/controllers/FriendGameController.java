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

import com.teamder.models.FriendGame;
import com.teamder.services.GenericService;

@RestController
@RequestMapping("friend-games")
public class FriendGameController {

	@Autowired
	private GenericService<FriendGame> service;
	
	/**
	 * CRUD pour FriendGame
	 */
	
	@GetMapping()
	public List<FriendGame> getFriendGames() {
		return this.service.getAll();
	}
	
	@GetMapping("{id}")
	public FriendGame getFriendGameById(@PathVariable Long id) {
		return this.service.getById(id);
	}
	
	@PostMapping()
	public FriendGame saveFriendGame(@RequestBody FriendGame friendGame) {
		return this.service.save(friendGame);
	}
	
	@PatchMapping()
	public FriendGame updateFriendGame(@RequestBody FriendGame friendGame) {
		return this.service.save(friendGame);
	}
	
	@DeleteMapping("{id}")
	public void deleteById(@PathVariable Long id) {
		this.service.deleteById(id);
	}
	
	/**
	 * Fin du CRUD pour FriendGame
	 */
}