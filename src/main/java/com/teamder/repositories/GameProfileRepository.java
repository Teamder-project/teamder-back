package com.teamder.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamder.models.GameProfile;

public interface GameProfileRepository extends JpaRepository<GameProfile, Long> {

}
