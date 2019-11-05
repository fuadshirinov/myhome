package com.myhome.repository;

import com.myhome.domain.Adv;
import com.myhome.domain.Role;
import com.myhome.domain.User;

import java.util.List;
import java.util.Optional;

public interface UserRepository {
    Optional<User> getUserByEmail(String email);

    void insertUser(User user);

    Optional<User> getUserById(long id);

    Optional<User> getUserByToken(String token);

    void activateUser(User user);

    List<Role> getUserRoles(long userID);

    void updateUser(User user,long userID);

    void deleteUser(User user);

    int getUserCount(int status);

    List<User> getUsersForAdminDatatable(int status,int draw,int start,int length);

    Optional<User> getUserByAdvId(long advID);

}
