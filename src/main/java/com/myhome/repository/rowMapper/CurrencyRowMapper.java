package com.myhome.repository.rowMapper;

import com.myhome.domain.Currency;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class CurrencyRowMapper implements RowMapper<Currency> {
    @Override
    public Currency mapRow(ResultSet resultSet, int i) throws SQLException {

        Currency currency = new Currency();
        currency.setId(resultSet.getInt("id"));
        currency.setName(resultSet.getString("name"));
        currency.setIdate(resultSet.getTimestamp("idate").toLocalDateTime());
        if (resultSet.getTimestamp("udate") != null){
            currency.setUdate(resultSet.getTimestamp("udate").toLocalDateTime());
        }
        currency.setStatus(resultSet.getInt("status"));

        return currency;
    }
}
