package com.teamder.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamder.models.FriendGame;

public interface FriendGameRepository extends JpaRepository<FriendGame, Long> {

}
