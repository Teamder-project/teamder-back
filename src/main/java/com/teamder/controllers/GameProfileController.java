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

import com.teamder.models.GameProfile;
import com.teamder.services.interfaces.GameProfileInterface;

@CrossOrigin
@RestController
@RequestMapping("game-profiles")
public class GameProfileController {

	@Autowired
	private GameProfileInterface service;
	
	/**
	 * CRUD pour GameProfile
	 */
	
	@GetMapping()
	public List<GameProfile> getGameProfiles() {
		return this.service.getAll();
	}
	
	@GetMapping("swipe/{id}")
	public List<GameProfile> getGameProfilesForSwipe(@PathVariable Long id) {	
		return this.service.getProfilesForSwipe(id);
	}
	
	@GetMapping("swipe/{id}/{id1}/{id2}")
	public List<GameProfile> getGameProfilesForSwipe(@PathVariable Long id, @PathVariable Long id1, @PathVariable Long id2) {	
		return this.service.getProfilesForSwipe(id, id1, id2);
	}
	
	@GetMapping("{id}")
	public GameProfile getGameProfileById(@PathVariable Long id) {
		return this.service.getById(id);
	}
	
	@GetMapping("/gamer/{id}")
	public List<GameProfile> getGameProfileByGamerId(@PathVariable Long id) {
		return this.service.getByGamerId(id);
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