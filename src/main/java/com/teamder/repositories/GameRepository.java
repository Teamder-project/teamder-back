package com.teamder.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamder.models.Game;

public interface GameRepository extends JpaRepository<Game, Long> {

}
