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
public class FriendGame {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "id_FRIEND", referencedColumnName = "id")
	private Friend friend;
	@ManyToOne
	@JoinColumn(name = "id_GAME", referencedColumnName = "id")
	private Game game;
	
	public FriendGame(Friend friend, Game game) {
		super();
		this.friend = friend;
		this.game = game;
	}
	
	
}
