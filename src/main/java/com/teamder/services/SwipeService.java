package com.teamder.services;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.websocket.EncodeException;

import org.springframework.beans.factory.annotation.Autowired;

import com.teamder.models.Friend;
import com.teamder.models.FriendGame;
import com.teamder.models.Swipe;
import com.teamder.repositories.SwipeRepository;
import com.teamder.services.interfaces.GenericService;
import com.teamder.websockets.NotifsSwipeWebsocket;

public class SwipeService implements GenericService<Swipe> {

	@Autowired
	private SwipeRepository swipe;
	
	@Autowired
	private GenericService<Friend> friendService;
	
	@Autowired
	private GenericService<FriendGame> friendGameService;
	
	/**
	 * CRUD pour Swipe
	 */
	
	@Override
	public List<Swipe> getAll() {
		
		return this.swipe.findAll();
	}

	@Override
	public Swipe getById(Long id) {
		
		return this.swipe.findById(id).get();
	}

	@Override
	public Swipe save(Swipe swipe) {
		System.out.println(swipe);
		Swipe swipeDB = this.swipe.save(swipe);
		if(swipeDB.getState() == 1)
		{
			Swipe result = this.swipe.findSwipeBySwiperIdAndSwipedIdAndState(swipe.getSwiped().getId(), swipe.getSwiper().getId(), 1);
			System.out.println(result);
			if(result != null) {
				Friend friend = new Friend(LocalDateTime.now(), swipe.getSwiper().getGamer(), swipe.getSwiped().getGamer());
				friend = this.friendService.save(friend);
				FriendGame friendGame = new FriendGame(friend, swipe.getSwiped().getGame());
				this.friendGameService.save(friendGame);
				try {
					if(NotifsSwipeWebsocket.sessions.get(swipeDB.getSwiped().getGamer().getId()) != null) {
						NotifsSwipeWebsocket.sessions.get(swipeDB.getSwiped().getGamer().getId()).getBasicRemote().sendObject(swipeDB.getSwiper().getGamer());
					}
					if(NotifsSwipeWebsocket.sessions.get(swipeDB.getSwiper().getGamer().getId()) != null) {
						NotifsSwipeWebsocket.sessions.get(swipeDB.getSwiper().getGamer().getId()).getBasicRemote().sendObject(swipeDB.getSwiped().getGamer());
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (EncodeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return swipeDB;
	}

	@Override
	public Swipe update(Swipe swipe) {
		
		return this.swipe.save(swipe);
	}

	@Override
	public void deleteById(Long id) {
		
		this.swipe.deleteById(id);
		
	}
	
	/**
	 * Fin du CRUD pour Swipe
	 */
}
