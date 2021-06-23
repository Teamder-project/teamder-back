package com.teamder.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamder.models.Gamer;

public interface GamerRepository extends JpaRepository<Gamer, Long>{

	public Optional<Gamer> findByEmail(String email);
}
