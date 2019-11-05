package com.myhome.repository.rowMapper;

import com.myhome.domain.Notification;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class NotificationRowMapper implements RowMapper<Notification> {
    @Override
    public Notification mapRow(ResultSet resultSet, int i) throws SQLException {

        Notification notification = new Notification();
        notification.setId(resultSet.getLong("id"));
        notification.setFrom(resultSet.getString("from"));
        notification.setTo(resultSet.getString("to"));
        notification.setSource(resultSet.getString("source_system"));
        notification.setSubject(resultSet.getString("subject"));
        notification.setContent(resultSet.getString("content"));
        notification.setLogData(resultSet.getString("log_data"));
        notification.setIdate(resultSet.getTimestamp("idate").toLocalDateTime());
        if (resultSet.getTimestamp("udate")!=null){
            notification.setUdate(resultSet.getTimestamp("udate").toLocalDateTime());
        }
        notification.setProcessStatus(resultSet.getInt("process_status"));
        notification.setStatus(resultSet.getInt("status"));
        return notification;
    }
}
