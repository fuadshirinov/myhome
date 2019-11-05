package com.myhome.service.impl;

import com.myhome.domain.DataTableResult;
import com.myhome.domain.Role;
import com.myhome.domain.User;
import com.myhome.repository.UserRepository;
import com.myhome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;


    @Override
    public Optional<User> getUserByEmail(String email) {
        return userRepository.getUserByEmail(email);
    }

    @Override
    public void insertUser(User user) {
        userRepository.insertUser(user);
    }

    @Override
    public Optional<User> getUserByToken(String token) {
        return userRepository.getUserByToken(token);
    }

    @Override
    public void activateUser(User user) {
        userRepository.activateUser(user);
    }

    @Override
    public void updateUser(User user,long userID) {
        userRepository.updateUser(user,userID);
    }

    @Override
    public void deleteUser(User user) {
        userRepository.deleteUser(user);
    }

    @Override
    public List<Role> getUserRoles(long userID) {
        return userRepository.getUserRoles(userID);
    }

    @Override
    public int getUsersCount(int status) {
        return userRepository.getUserCount(status);
    }

    @Override
    public DataTableResult getUsersForAdminDatatable(int status, int draw, int start, int length) {

        DataTableResult result = new DataTableResult();

        int userCount = getUsersCount(status);

        result.setDraw(draw);
        result.setRecordsTotal(userCount);
        result.setRecordsFiltered(userCount);
        List<User> users = userRepository.getUsersForAdminDatatable(status, draw, start, length);

        Object[][] data = new Object[users.size()][8];
        int counter = 0;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy hh:mm");

        for (User user : users){
            data[counter][0] = user.getId();
            data[counter][1] = user.getName();
            data[counter][2] = user.getSurname();
            data[counter][3] = user.getEmail();
            data[counter][4] = user.getMobile();
            data[counter][5] = user.getIdate().format(formatter);
            data[counter][6] = "<a href='message?userID=" + user.getId()+ "'><button style='background-color:yellow;color:black;cursor:pointer' class='btn' >Mesaj gonder</button></a>";
            data[counter][7] = "<a href='user-advs?id=" + user.getId()+ "'><button style='background-color:green;color:white;cursor:pointer' class='btn' >Elanlarina bax</button></a>";
            counter ++;
        }
        result.setData(data);
        return result;
    }

    @Override
    public Optional<User> getUserById(long id) {
        return userRepository.getUserById(id);
    }

    @Override
    public Optional<User> getUserByAdvId(long advID) {
        return userRepository.getUserByAdvId(advID);
    }

}
