package com.teamder.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.teamder.models.GameProfile;

public interface GameProfileRepository extends JpaRepository<GameProfile, Long> {

	// Récupère les profils, qui ne sont pas les siens, sur le même jeu, ET qu'il n'a pas déjà swiper, ET qui ne sont pas amis
	@Query(value = "SELECT * FROM game_profile WHERE NOT id_GAMER = ?2 AND id_GAME = ?3 "
			+ "AND id NOT IN (SELECT id_2_GAME_PROFILE FROM swipe WHERE id_GAME_PROFILE = ?1) "
			+ "AND id_GAMER NOT IN (SELECT id_GAMER FROM friend WHERE id_2_GAMER = ?2) "
			+ "AND id_GAMER NOT IN (SELECT id_2_GAMER FROM friend WHERE id_GAMER = ?2)", nativeQuery = true)
	
	List<GameProfile> getProfilesSwipe(long id, long idGamer, long idGame);
	public List<GameProfile> findByGamerId(Long id);
}
