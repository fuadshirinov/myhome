package com.myhome.service;

import com.myhome.domain.DataTableResult;
import com.myhome.domain.Role;
import com.myhome.domain.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    Optional<User> getUserByEmail(String email);

    void insertUser(User user);

    Optional<User> getUserByToken(String token);

    void activateUser(User user);

    void updateUser(User user,long userID);

    void deleteUser(User user);

    List<Role> getUserRoles(long userID);

    int getUsersCount(int status);

    DataTableResult getUsersForAdminDatatable(int status,int draw,int start,int length);

    Optional<User> getUserById(long id);

    Optional<User> getUserByAdvId(long advID);


}
