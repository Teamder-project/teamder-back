package com.teamder.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamder.models.Friend;
import com.teamder.models.GameProfile;

public interface FriendRepository extends JpaRepository<Friend, Long> {
	public List<Friend> findByGamer1Id(Long id);

	

}
