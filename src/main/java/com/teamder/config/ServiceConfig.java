package com.teamder.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.teamder.models.Friend;
import com.teamder.models.FriendChat;
import com.teamder.models.FriendGame;
import com.teamder.models.FriendRequest;
import com.teamder.services.FriendChatService;
import com.teamder.services.FriendGameService;
import com.teamder.services.FriendRequestService;
import com.teamder.services.FriendService;
import com.teamder.services.GenericService;

@Configuration
public class ServiceConfig {
	
	@Bean
	public GenericService<FriendChat> FriendChatServiceFactory() {
		return new FriendChatService();
	}
	
	@Bean
	public GenericService<Friend> FriendServiceFactory() {
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
}

