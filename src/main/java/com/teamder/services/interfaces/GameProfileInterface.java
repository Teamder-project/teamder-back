package com.teamder.services.interfaces;

import java.util.List;

import com.teamder.models.GameProfile;

public interface GameProfileInterface extends GenericService<GameProfile> {

	public List<GameProfile> getByGamerId(Long id);
	
	public List<GameProfile> getProfilesForSwipe(Long id);
	
	public List<GameProfile> getProfilesForSwipe(Long id, Long id1, Long id2);
	
	
}
