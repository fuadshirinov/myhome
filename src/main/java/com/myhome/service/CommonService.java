package com.myhome.service;

import com.myhome.domain.*;

import java.util.List;

public interface CommonService {
    List<Estate> getEstates();
    List<City> getCities();
    List<Currency> getCurrencies();
    boolean emailIsPresent(String email);
    int insertUserRole(long userId,long roleId);
    int deleteSeller(long userID);
    int deleteAllRolesOfUser(long userID);
}
