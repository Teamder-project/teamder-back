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
public class GameProfileEdit {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nickname_game;
	private String goals;
	private String schedule;
	private String description;
	@ManyToOne
	@JoinColumn(name = "id_GAME_PROFILE", referencedColumnName = "id")
	private GameProfile gameProfile;

}

