package com.teamder.websockets.coders;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import com.teamder.models.Gamer;
import com.google.gson.Gson;

public class GamerEncoder implements Encoder.Text<Gamer> {

    private static Gson gson = new Gson();

    @Override
    public String encode(Gamer message) throws EncodeException {
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