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
public class Rating {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private int rating;
	@ManyToOne
	@JoinColumn(name = "id_GAMER", referencedColumnName = "id")
	private Gamer rater;
	@ManyToOne
	@JoinColumn(name = "id_2_GAMER", referencedColumnName = "id")
	private Gamer rated;
}