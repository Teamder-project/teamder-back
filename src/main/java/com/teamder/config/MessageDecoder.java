package com.teamder.config;

import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

import com.teamder.models.FriendChat;
import com.google.gson.Gson;

public class MessageDecoder implements Decoder.Text<FriendChat> {

    private static Gson gson = new Gson();

    @Override
    public FriendChat decode(String s) throws DecodeException {
        FriendChat message = gson.fromJson(s, FriendChat.class);
        return message;
    }

    @Override
    public boolean willDecode(String s) {
        return (s != null);
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
