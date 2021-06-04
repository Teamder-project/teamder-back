package com.teamder.models;

import java.time.LocalDateTime;

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
public class FriendRequest {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private LocalDateTime date_request;
	@ManyToOne
	@JoinColumn(name = "id_GAMER", referencedColumnName = "id")
	private Gamer sender;
	@ManyToOne
	@JoinColumn(name = "id_2_GAMER", referencedColumnName = "id")
	private Gamer receiver;
}