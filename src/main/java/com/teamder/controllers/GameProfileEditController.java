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

import com.teamder.models.GameProfileEdit;
import com.teamder.services.interfaces.GenericService;

@RestController
@RequestMapping("game-profiles-edit")
public class GameProfileEditController {

	@Autowired
	private GenericService<GameProfileEdit> service;
	
	/**
	 * CRUD pour GameProfileEdit
	 */
	
	@GetMapping()
	public List<GameProfileEdit> getGameProfileEdits() {
		return this.service.getAll();
	}
	
	@GetMapping("{id}")
	public GameProfileEdit getGameProfileEditById(@PathVariable Long id) {
		return this.service.getById(id);
	}
	
	@PostMapping()
	public GameProfileEdit saveGameProfileEdit(@RequestBody GameProfileEdit gameProfileEdit) {
		return this.service.save(gameProfileEdit);
	}
	
	@PatchMapping()
	public GameProfileEdit updateGameProfileEdit(@RequestBody GameProfileEdit gameProfileEdit) {
		return this.service.save(gameProfileEdit);
	}
	
	@DeleteMapping("{id}")
	public void deleteById(@PathVariable Long id) {
		this.service.deleteById(id);
	}
	
	/**
	 * Fin du CRUD pour GameProfileEdit
	 */
}