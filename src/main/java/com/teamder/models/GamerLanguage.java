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
public class GamerLanguage {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "id_GAMER", referencedColumnName = "id")
	private Gamer gamer;
	@ManyToOne
	@JoinColumn(name = "id_LANGUAGE", referencedColumnName = "id")
	private Language language;
}
