package com.teamder.services.interfaces;

import java.util.Optional;

import com.teamder.models.Gamer;

public interface GamerInterface extends GenericService<Gamer> {

	Optional<Gamer> getByEmail(String email);

	Long loginGamer(Gamer gamer);
	
}
