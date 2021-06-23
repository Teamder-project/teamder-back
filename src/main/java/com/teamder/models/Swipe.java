package com.teamder.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
public class Swipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private int state;
	@ManyToOne
	@JoinColumn(name = "id_GAME_PROFILE", referencedColumnName = "id")
	private GameProfile swiper;
	@ManyToOne
	@JoinColumn(name = "id_2_GAME_PROFILE", referencedColumnName = "id")
	private GameProfile swiped;
}
