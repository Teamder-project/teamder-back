package com.teamder.models;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Friend {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private LocalDateTime date_match;
	@ManyToOne
	@JoinColumn(name = "id_GAMER", referencedColumnName = "id")
	private Gamer gamer1;
	@ManyToOne
	@JoinColumn(name = "id_2_GAMER", referencedColumnName = "id")
	private Gamer gamer2;
	
	public Friend(LocalDateTime date_match, Gamer gamer1, Gamer gamer2) {
		super();
		this.date_match = date_match;
		this.gamer1 = gamer1;
		this.gamer2 = gamer2;
	}
	
	
}
