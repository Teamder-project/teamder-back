package com.teamder.websockets.coders;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import com.teamder.models.FriendChat;
import com.google.gson.Gson;

public class FriendChatEncoder implements Encoder.Text<FriendChat> {

    private static Gson gson = new Gson();

    @Override
    public String encode(FriendChat message) throws EncodeException {
        String json = gson.toJson(message);
        return json;
    }

    @Override
    public void init(EndpointConfig endpointConfig) {
        // Custom initialization logic
    }

    @Override
    public void destroy() {
        // Close resources
    }
}