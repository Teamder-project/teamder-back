package com.teamder.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamder.models.FriendRequest;

public interface FriendRequestRepository extends JpaRepository<FriendRequest, Long> {

}
