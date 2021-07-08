package com.teamder;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;

@EnableWebSocket
@SpringBootApplication
public class TeamderBackApplication {

	public static void main(String[] args) {
		SpringApplication.run(TeamderBackApplication.class, args);
	}

}
