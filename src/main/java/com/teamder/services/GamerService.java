package com.teamder.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamder.models.Gamer;
import com.teamder.repositories.GamerRepository;

public class GamerService implements GenericService<Gamer> {

	@Autowired
	private GamerRepository repository;
	
	/**
	 * CRUD pour Gamer
	 */
	
	@Override
	public List<Gamer> getAll() {
		
		return this.repository.findAll();
	}

	@Override
	public Gamer getById(Long id) {
		
		return this.repository.findById(id).get();
	}

	@Override
	public Gamer save(Gamer gamer) {
		
		return this.repository.save(gamer);
	}

	@Override
	public Gamer update(Gamer gamer) {
		
		return this.repository.save(gamer);
	}

	@Override
	public void deleteById(Long id) {
		
		this.repository.deleteById(id);
	}
	
	/**
	 * Fin du CRUD pour Gamer
	 */
	
}
