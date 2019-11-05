package com.myhome.security;

import com.myhome.domain.User;
import com.myhome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.Optional;

@Service
public class MyHomeUserDetailService implements UserDetailsService, Serializable {

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Optional<User> optionalUser = userService.getUserByEmail(username);
        System.out.println("username = " + username);
        UserPrincipal userPrincipal = null;
        if (optionalUser.isPresent()){
            User user = optionalUser.get();
            user.setRoleList(userService.getUserRoles(user.getId()));
            System.out.println("user = " + user);
            userPrincipal = new UserPrincipal(user);
        }else{
            throw new UsernameNotFoundException("user " + username + ",not found!");
        }

        return userPrincipal;
    }
}
