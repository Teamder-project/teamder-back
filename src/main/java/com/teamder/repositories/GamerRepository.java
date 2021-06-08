package com.teamder.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamder.models.Gamer;

public interface GamerRepository extends JpaRepository<Gamer, Long>{

}
