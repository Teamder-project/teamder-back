package com.teamder.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamder.models.FriendChat;

public interface FriendChatRepository extends JpaRepository<FriendChat, Long> {

}
