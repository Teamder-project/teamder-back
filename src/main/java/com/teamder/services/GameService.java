package com.teamder.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamder.models.Game;
import com.teamder.repositories.GameRepository;

public class GameService implements GenericService<Game> {

	@Autowired
	private GameRepository game;
	
	/**
	 * CRUD pour Game
	 */
	
	@Override
	public List<Game> getAll() {
		
		return this.game.findAll();
	}

	@Override
	public Game getById(Long id) {
		
		return this.game.findById(id).get();
	}

	@Override
	public Game save(Game game) {
		
		return this.game.save(game);
	}

	@Override
	public Game update(Game game) {
		
		return this.game.save(game);
	}

	@Override
	public void deleteById(Long id) {
		
		this.game.deleteById(id);
		
	}
	
	/**
	 * Fin du CRUD pour Game
	 */
}
