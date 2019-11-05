package com.myhome.repository.impl;

import com.myhome.domain.*;
import com.myhome.repository.CommonRepository;
import com.myhome.repository.SqlQuery;
import com.myhome.repository.rowMapper.CityRowMapper;
import com.myhome.repository.rowMapper.CurrencyRowMapper;
import com.myhome.repository.rowMapper.EstateRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

import static com.myhome.repository.SqlQuery.*;

@Repository
public class CommonRepositoryImpl implements CommonRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private EstateRowMapper estateRowMapper;
    @Autowired
    private CityRowMapper cityRowMapper;



    @Autowired
    private CurrencyRowMapper currencyRowMapper;

    @Override
    public List<Estate> getEstates() {
        return jdbcTemplate.query(GET_ESTATES,estateRowMapper);
    }

    @Override
    public List<City> getCities() {
        return jdbcTemplate.query(GET_CITIES,cityRowMapper);
    }


    @Override
    public List<Currency> getCurrencies() {
        return jdbcTemplate.query(GET_CURRENCIES,currencyRowMapper);
    }

    @Override
    public boolean emailIsPresent(String email) {
        Object[] args = {email};
        int count = jdbcTemplate.queryForObject(CHECK_EMAIL,args,Integer.class);
        if (count == 0){
            return false;
        }
        else{
            return true;
        }
    }

    @Override
    public int insertUserRole(long userId,long roleId) {

        Object[] args = {userId,roleId};
       return jdbcTemplate.update(INSERT_USER_ROLE,args);
    }

    @Override
    public int deleteSeller(long userID) {
        Object[] args = {userID};
        return jdbcTemplate.update(DELETE_SELLER,args);
    }

    @Override
    public int deleteAllRolesOfUser(long UserID) {
        Object[] args = {UserID};
        return jdbcTemplate.update(DELETE_ALL_ROLES_OF_USER,args);
    }


}
