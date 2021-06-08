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

import com.teamder.models.GameProfile;
import com.teamder.services.GenericService;

@RestController
@RequestMapping("game-profiles")
public class GameProfileController {

	@Autowired
	private GenericService<GameProfile> service;
	
	/**
	 * CRUD pour GameProfile
	 */
	
	@GetMapping()
	public List<GameProfile> getGameProfiles() {
		return this.service.getAll();
	}
	
	@GetMapping("{id}")
	public GameProfile getGameProfileById(@PathVariable Long id) {
		return this.service.getById(id);
	}
	
	@PostMapping()
	public GameProfile saveGameProfile(@RequestBody GameProfile gameProfile) {
		return this.service.save(gameProfile);
	}
	
	@PatchMapping()
	public GameProfile updateGameProfile(@RequestBody GameProfile gameProfile) {
		return this.service.save(gameProfile);
	}
	
	@DeleteMapping("{id}")
	public void deleteById(@PathVariable Long id) {
		this.service.deleteById(id);
	}
	
	/**
	 * Fin du CRUD pour GameProfile
	 */
}