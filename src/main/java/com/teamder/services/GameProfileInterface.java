package com.teamder.services;

import java.util.List;

import com.teamder.models.GameProfile;

public interface GameProfileInterface extends GenericService<GameProfile> {

	public List<GameProfile> getByGamerId(Long id);
}
