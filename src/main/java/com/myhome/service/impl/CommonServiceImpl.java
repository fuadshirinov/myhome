package com.myhome.service.impl;

import com.myhome.domain.*;
import com.myhome.repository.CommonRepository;
import com.myhome.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommonServiceImpl implements CommonService {

    @Autowired
    private CommonRepository commonRepository;

    @Override
    public List<Estate> getEstates() {
        return commonRepository.getEstates();
    }

    @Override
    public List<City> getCities() {
        return commonRepository.getCities();
    }


    public List<Currency> getCurrencies(){
        return commonRepository.getCurrencies();
    }

    @Override
    public boolean emailIsPresent(String email) {
        return commonRepository.emailIsPresent(email);
    }

    @Override
    public int insertUserRole(long userId,long roleId) {
        return commonRepository.insertUserRole(userId,roleId);
    }

    @Override
    public int deleteSeller(long userID) {
        return commonRepository.deleteSeller(userID);
    }

    @Override
    public int deleteAllRolesOfUser(long userID) {
        return commonRepository.deleteAllRolesOfUser(userID);
    }
}
