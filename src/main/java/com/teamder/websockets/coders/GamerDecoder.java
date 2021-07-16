package com.teamder.websockets.coders;

import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

import com.teamder.models.Gamer;
import com.google.gson.Gson;

public class GamerDecoder implements Decoder.Text<Gamer> {

    private static Gson gson = new Gson();

    @Override
    public Gamer decode(String s) throws DecodeException {
        Gamer message = gson.fromJson(s, Gamer.class);
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
