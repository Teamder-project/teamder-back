package com.teamder.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import com.teamder.models.Gamer;
import com.teamder.repositories.GamerRepository;
import com.teamder.services.interfaces.GamerInterface;

public class GamerService implements GamerInterface {

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
	public Optional<Gamer> getByEmail(String email) {
		
		return this.repository.findByEmail(email);
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
	
	@Override
	public Long loginGamer(Gamer gamer) {
		Optional<Gamer> optional = this.repository.findByEmail(gamer.getEmail());
		Gamer gamerDB = optional.orElseThrow(()-> new ResponseStatusException(HttpStatus.NOT_FOUND));
		
		if(gamer.getPassword().equals(gamerDB.getPassword())) {
			return gamerDB.getId();
		}
		throw new ResponseStatusException(HttpStatus.FORBIDDEN);
	}
}
