package com.myhome.repository.rowMapper;

import com.myhome.domain.City;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class CityRowMapper implements RowMapper<City> {

    @Override
    public City mapRow(ResultSet resultSet, int i) throws SQLException {
        City city = new City();

        city.setId(resultSet.getLong("id"));
        city.setName(resultSet.getString("name"));
        city.setIdate(resultSet.getTimestamp("idate").toLocalDateTime());
        if ((resultSet.getTimestamp("udate")!=null)){
            city.setUdate(resultSet.getTimestamp("udate").toLocalDateTime());
        }
        city.setStatus(resultSet.getInt("status"));

        return city;
    }
}
