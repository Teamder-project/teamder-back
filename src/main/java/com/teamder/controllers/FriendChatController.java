package com.teamder.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.teamder.models.FriendChat;
import com.teamder.services.interfaces.FriendChatInterface;

@CrossOrigin
@RestController
@RequestMapping("friend-chats")
public class FriendChatController {

	@Autowired
	private FriendChatInterface service;
	
	/**
	 * CRUD pour FriendChat
	 */
	
	@GetMapping()
	public List<FriendChat> getFriendChats() {
		return this.service.getAll();
	}
	
	@GetMapping("gamer/{idGamer}")
	public List<FriendChat> getFriendChatsByGamer(@PathVariable Long idGamer) {
		return this.service.getMessagesByGamer(idGamer);
	}
	
	@GetMapping("{id}")
	public FriendChat getFriendChatById(@PathVariable Long id) {
		return this.service.getById(id);
	}
	
	@PostMapping()
	public FriendChat saveFriendChat(@RequestBody FriendChat friendChat) {
		return this.service.save(friendChat);
	}
	
	@PatchMapping()
	public FriendChat updateFriendChat(@RequestBody FriendChat friendChat) {
		return this.service.save(friendChat);
	}
	
	@DeleteMapping("{id}")
	public void deleteById(@PathVariable Long id) {
		this.service.deleteById(id);
	}
	
	/**
	 * Fin du CRUD pour FriendChat
	 */
	
	
}