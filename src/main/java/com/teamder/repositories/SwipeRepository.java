package com.teamder.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.teamder.models.Swipe;

public interface SwipeRepository extends JpaRepository<Swipe, Long> {

	
}
