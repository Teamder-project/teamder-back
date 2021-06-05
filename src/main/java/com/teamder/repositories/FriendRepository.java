package com.teamder.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamder.models.Friend;

public interface FriendRepository extends JpaRepository<Friend, Long> {

}
