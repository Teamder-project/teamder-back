package com.teamder.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamder.models.Swipe;
import com.teamder.repositories.SwipeRepository;
import com.teamder.services.interfaces.GenericService;

public class SwipeService implements GenericService<Swipe> {

	@Autowired
	private SwipeRepository swipe;
	
	/**
	 * CRUD pour Swipe
	 */
	
	@Override
	public List<Swipe> getAll() {
		
		return this.swipe.findAll();
	}

	@Override
	public Swipe getById(Long id) {
		
		return this.swipe.findById(id).get();
	}

	@Override
	public Swipe save(Swipe swipe) {
		
		return this.swipe.save(swipe);
	}

	@Override
	public Swipe update(Swipe swipe) {
		
		return this.swipe.save(swipe);
	}

	@Override
	public void deleteById(Long id) {
		
		this.swipe.deleteById(id);
		
	}
	
	/**
	 * Fin du CRUD pour Swipe
	 */
}
