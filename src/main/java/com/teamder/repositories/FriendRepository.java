package com.teamder.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.teamder.models.Friend;

public interface FriendRepository extends JpaRepository<Friend, Long> {

	@Query(value = "SELECT * FROM friend WHERE id_GAMER = ?1", nativeQuery = true)
    List<Friend> getGamersByGamer(Long idGamer);

	@Query(value = "SELECT * FROM friend WHERE id_2_GAMER = ?1", nativeQuery = true)
    List<Friend> getGamersByGamerBis(Long idGamer);
}
