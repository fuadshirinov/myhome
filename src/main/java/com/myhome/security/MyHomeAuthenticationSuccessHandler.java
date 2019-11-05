package com.myhome.security;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class MyHomeAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    private Logger logger = LogManager.getLogger(MyHomeAuthenticationSuccessHandler.class);
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        UserPrincipal userPrincipal = (UserPrincipal) authentication.getPrincipal();
        request.getSession().setAttribute("user",userPrincipal.getUser());
        logger.info("User " + userPrincipal.getUser().getEmail() + "ugurla login oldu");
        String page = userPrincipal.getUser().getRoleList().get(0).getSuccessPage();
        response.sendRedirect(request.getContextPath() + page);
    }
}
