package com.teamder.repositories;


import org.springframework.data.jpa.repository.JpaRepository;

import com.teamder.models.Swipe;

public interface SwipeRepository extends JpaRepository<Swipe, Long> {

	public Swipe findSwipeBySwiperIdAndSwipedIdAndState(Long swiperId, Long swipedId, int state);
}
