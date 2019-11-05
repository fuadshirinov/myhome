package com.myhome.repository.rowMapper;

import com.myhome.domain.User;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class UserRowMapper implements RowMapper<User> {
    @Override
    public User mapRow(ResultSet resultSet, int i) throws SQLException {

        User user = new User();
        user.setId(resultSet.getLong("id"));
        user.setName(resultSet.getString("name"));
        user.setSurname(resultSet.getString("surname"));
        user.setEmail(resultSet.getString("email"));
        user.setMobile(resultSet.getString("mobile"));
        user.setPassword(resultSet.getString("password"));
        user.setProcessStatus(resultSet.getInt("process_status"));
        user.setIdate(resultSet.getTimestamp("idate").toLocalDateTime());
        if (resultSet.getTimestamp("udate")!=null){
            user.setUdate(resultSet.getTimestamp("udate").toLocalDateTime());
        }
        user.setStatus(resultSet.getInt("status"));

        return user;
    }
}
