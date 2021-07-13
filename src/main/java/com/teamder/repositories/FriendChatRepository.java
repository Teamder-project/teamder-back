package com.teamder.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.teamder.models.FriendChat;

public interface FriendChatRepository extends JpaRepository<FriendChat, Long> {
	
	@Query(value = "SELECT * FROM friend_chat WHERE id_GAMER = ?1 OR id_2_GAMER = ?1", nativeQuery = true)
    List<FriendChat> getMessagesByGamer(Long idGamer);
}
