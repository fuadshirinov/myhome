package com.myhome.repository.rowMapper;

import com.myhome.domain.Role;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class RoleRowMapper implements RowMapper<Role> {
    @Override
    public Role mapRow(ResultSet rs, int rowNum) throws SQLException {

        Role role = Role.fromId(rs.getInt("id"));
        role.setSuccessPage(rs.getString("success_page"));
        role.setName(rs.getString("name"));
        return role;
    }
}
