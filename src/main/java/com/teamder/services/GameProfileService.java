package com.teamder.services;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamder.models.GameProfile;
import com.teamder.repositories.GameProfileRepository;
import com.teamder.services.interfaces.GameProfileInterface;

public class GameProfileService implements GameProfileInterface {

	@Autowired
	private GameProfileRepository gameProfile;
	
	
	/**
	 * CRUD pour GameProfile
	 */
	
	@Override
	public List<GameProfile> getAll() {
		
		return this.gameProfile.findAll();
	}

	@Override
	public GameProfile getById(Long id) {
		
		return this.gameProfile.findById(id).get();
	}
	
	public List<GameProfile> getByGamerId(Long id) {
		
		return this.gameProfile.findByGamerId(id);
	}

	
	@Override
	public GameProfile save(GameProfile gameProfile) {
		
		return this.gameProfile.save(gameProfile);
	}

	@Override
	public GameProfile update(GameProfile gameProfile) {
		
		return this.gameProfile.save(gameProfile);
	}

	@Override
	public void deleteById(Long id) {
		
		this.gameProfile.deleteById(id);
		
	}

	@Override
	public List<GameProfile> getProfilesForSwipe(GameProfile gameProfile) {
		GameProfile gameProfileDb = this.gameProfile.getById(gameProfile.getId());
		List<GameProfile> result = this.gameProfile.getProfilesSwipe(gameProfileDb.getId(), gameProfileDb.getGamer().getId(), gameProfileDb.getGame().getId());
		Collections.shuffle(result);
		return result;
	}
	
	/**
	 * Fin du CRUD pour GameProfile
	 */
}
