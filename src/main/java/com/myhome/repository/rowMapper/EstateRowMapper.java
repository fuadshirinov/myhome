package com.myhome.repository.rowMapper;

import com.myhome.domain.Estate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class EstateRowMapper implements RowMapper<Estate> {

    @Override
    public Estate mapRow(ResultSet resultSet, int i) throws SQLException {

        Estate estate = new Estate();
        estate.setId(resultSet.getLong("id"));
        estate.setName(resultSet.getString("name"));
        estate.setIdate(resultSet.getTimestamp("idate").toLocalDateTime());
        if (resultSet.getTimestamp("udate")!=null){
            estate.setUdate(resultSet.getTimestamp("udate").toLocalDateTime());
        }
        estate.setStatus(resultSet.getInt("status"));

        return estate;
    }
}
