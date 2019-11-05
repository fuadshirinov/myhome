package com.myhome.util;

import java.util.UUID;

public class SecurityUtil {
    public static String generateToken(){
        UUID randomUUID = UUID.randomUUID();
        String token = randomUUID.toString();
        return token;
    }
}
