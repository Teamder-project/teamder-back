package com.teamder.services.interfaces;

import java.util.List;

import com.teamder.models.Friend;

public interface FriendInterface extends GenericService<Friend>{
	public List<Friend> getByGamerId(Long id);


}
