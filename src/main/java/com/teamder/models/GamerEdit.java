package com.teamder.models;

import java.time.LocalDate;

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
public class GamerEdit {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String username;
	private String password;
	private String email;
	private LocalDate birthday;
	private String gender;
	private String country;
	private String avatar;
	@ManyToOne
	@JoinColumn(name = "id_GAMER", referencedColumnName = "id")
	private Gamer gamer;
	
}
