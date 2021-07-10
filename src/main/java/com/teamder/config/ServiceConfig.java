package com.teamder.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.teamder.models.Friend;
import com.teamder.models.FriendChat;
import com.teamder.models.FriendGame;
import com.teamder.models.FriendRequest;
import com.teamder.models.Game;
import com.teamder.models.GameProfileEdit;
import com.teamder.models.Swipe;
import com.teamder.services.FriendChatService;
import com.teamder.services.FriendGameService;
import com.teamder.services.FriendRequestService;
import com.teamder.services.FriendService;
import com.teamder.services.GamerService;
import com.teamder.services.GameProfileEditService;
import com.teamder.services.GameProfileService;
import com.teamder.services.GameService;
import com.teamder.services.SwipeService;
import com.teamder.services.interfaces.FriendInterface;
import com.teamder.services.interfaces.GameProfileInterface;
import com.teamder.services.interfaces.GamerInterface;
import com.teamder.services.interfaces.GenericService;

@Configuration
public class ServiceConfig {
	
	@Bean
	public GamerInterface GamerServiceFactory() {
		return new GamerService();
	}
	
	@Bean
	public GenericService<FriendChat> FriendChatServiceFactory() {
		return new FriendChatService();
	}
	
	@Bean
	public FriendInterface FriendServiceFactory() {
		return new FriendService();
	}
	
	@Bean
	public GenericService<FriendGame> FriendGameServiceFactory() {
		return new FriendGameService();
	}
	
	@Bean
	public GenericService<FriendRequest> FriendRequestServiceFactory() {
		return new FriendRequestService();
	}
	
	@Bean
	public GenericService<Game> GameServiceFactory() {
		return new GameService();
	}
	
	@Bean
	public GameProfileInterface GameProfileServiceFactory() {
		return new GameProfileService();
	}
	
	@Bean
	public GenericService<GameProfileEdit> GameProfileEditServiceFactory() {
		return new GameProfileEditService();
	}
	
	@Bean
	public GenericService<Swipe> SwipeServiceFactory() {
		return new SwipeService();
	}
	

}

