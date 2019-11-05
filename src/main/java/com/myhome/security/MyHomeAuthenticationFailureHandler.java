package com.myhome.security;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class MyHomeAuthenticationFailureHandler implements AuthenticationFailureHandler {

    Logger logger = LogManager.getLogger(MyHomeAuthenticationFailureHandler.class);

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        logger.error("User login olarken xeta bas verdi,sebeb = " + exception.getMessage());
        System.out.println("excetion = " + exception.getMessage());
        if (exception instanceof BadCredentialsException){
            response.sendRedirect(request.getContextPath() + "/login?error");
        }
    }
}
