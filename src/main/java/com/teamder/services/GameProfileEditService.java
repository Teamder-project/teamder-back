package com.teamder.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamder.models.GameProfileEdit;
import com.teamder.repositories.GameProfileEditRepository;

public class GameProfileEditService implements GenericService<GameProfileEdit> {

	@Autowired
	private GameProfileEditRepository gameProfileEdit;
	
	/**
	 * CRUD pour GameProfileEdit
	 */
	
	@Override
	public List<GameProfileEdit> getAll() {
		
		return this.gameProfileEdit.findAll();
	}

	@Override
	public GameProfileEdit getById(Long id) {
		
		return this.gameProfileEdit.findById(id).get();
	}

	@Override
	public GameProfileEdit save(GameProfileEdit gameProfileEdit) {
		
		return this.gameProfileEdit.save(gameProfileEdit);
	}

	@Override
	public GameProfileEdit update(GameProfileEdit gameProfileEdit) {
		
		return this.gameProfileEdit.save(gameProfileEdit);
	}

	@Override
	public void deleteById(Long id) {
		
		this.gameProfileEdit.deleteById(id);
		
	}
	
	/**
	 * Fin du CRUD pour GameProfileEdit
	 */
}
