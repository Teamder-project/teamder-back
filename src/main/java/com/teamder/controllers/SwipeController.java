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

import com.teamder.models.Swipe;
import com.teamder.services.interfaces.GenericService;

@RestController
@RequestMapping("swipes")
@CrossOrigin
public class SwipeController {

	@Autowired
	private GenericService<Swipe> service;
	
	/**
	 * CRUD pour Swipe
	 */
	
	@GetMapping()
	public List<Swipe> getSwipes() {
		return this.service.getAll();
	}
	
	@GetMapping("{id}")
	public Swipe getSwipeById(@PathVariable Long id) {
		return this.service.getById(id);
	}
	
	@PostMapping()
	public Swipe saveSwipe(@RequestBody Swipe swipe) {
		return this.service.save(swipe);
	}
	
	@PatchMapping()
	public Swipe updateSwipe(@RequestBody Swipe swipe) {
		return this.service.save(swipe);
	}
	
	@DeleteMapping("{id}")
	public void deleteById(@PathVariable Long id) {
		this.service.deleteById(id);
	}
	
	/**
	 * Fin du CRUD pour Swipe
	 */
}