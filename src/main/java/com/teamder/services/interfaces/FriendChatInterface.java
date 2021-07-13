package com.teamder.services.interfaces;

import java.util.List;

import com.teamder.models.FriendChat;

public interface FriendChatInterface extends GenericService<FriendChat>{
	
	public List<FriendChat> getMessagesByGamer(Long idGamer);
}
