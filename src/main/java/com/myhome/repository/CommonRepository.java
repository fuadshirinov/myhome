package com.myhome.repository;

import com.myhome.domain.*;

import java.util.List;
import java.util.Optional;

public interface CommonRepository {
    List<Estate> getEstates();
    List<City> getCities();
    List<Currency> getCurrencies();
    boolean emailIsPresent(String email);
    int insertUserRole(long userId,long roleId);
    int deleteSeller(long userID);
    int deleteAllRolesOfUser(long UserID);
}
