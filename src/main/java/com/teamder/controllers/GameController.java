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

import com.teamder.models.Game;
import com.teamder.services.GenericService;

@RestController
@RequestMapping("games")
public class GameController {

	@Autowired
	private GenericService<Game> service;
	
	/**
	 * CRUD pour Game
	 */
	
	@GetMapping()
	public List<Game> getGames() {
		return this.service.getAll();
	}
	
	@GetMapping("{id}")
	public Game getGameById(@PathVariable Long id) {
		return this.service.getById(id);
	}
	
	@PostMapping()
	public Game saveGame(@RequestBody Game game) {
		return this.service.save(game);
	}
	
	@PatchMapping()
	public Game updateGame(@RequestBody Game game) {
		return this.service.save(game);
	}
	
	@DeleteMapping("{id}")
	public void deleteById(@PathVariable Long id) {
		this.service.deleteById(id);
	}
	
	/**
	 * Fin du CRUD pour Game
	 */
}