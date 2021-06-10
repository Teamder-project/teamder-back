package com.teamder.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamder.models.GameProfile;

public interface GameProfileRepository extends JpaRepository<GameProfile, Long> {

	public List<GameProfile> findByGamerId(Long id);
}
