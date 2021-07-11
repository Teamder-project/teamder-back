package com.teamder.services.interfaces;

import java.util.List;


import com.teamder.models.Friend;
import com.teamder.models.Gamer;

public interface FriendInterface extends GenericService<Friend>{

	public List<Gamer> getGamersByGamerId(Long idGamer);
}
