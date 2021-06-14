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

import com.teamder.models.Gamer;
import com.teamder.services.GamerInterface;

@RestController
@RequestMapping("gamers")
public class GamerController {

	@Autowired
	private GamerInterface service;
	
	/**
	 * CRUD pour Gamer
	 */
	
	@GetMapping()
	public List<Gamer> getGamers() {
		return this.service.getAll();
	}
	
	@GetMapping("{id}")
	public Gamer getGamerById(@PathVariable Long id) {
		return this.service.getById(id);
	}
	
	@PostMapping()
	public Gamer saveGamer(@RequestBody Gamer gamer) {
		return this.service.save(gamer);
	}
	
	@PatchMapping()
	public Gamer updateGamer(@RequestBody Gamer gamer) {
		return this.service.save(gamer);
	}
	
	@DeleteMapping("{id}")
	public void deleteById(@PathVariable Long id) {
		this.service.deleteById(id);
	}
	
	/**
	 * Fin du CRUD pour Gamer
	 */
	
	@PostMapping("connexion")
	public Long connexion(@RequestBody Gamer gamer) {
		return this.service.loginGamer(gamer);
	}
}