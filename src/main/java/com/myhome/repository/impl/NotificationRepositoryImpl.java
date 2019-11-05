package com.myhome.repository.impl;

import com.myhome.domain.Notification;
import com.myhome.repository.NotificationRepository;
import com.myhome.repository.SqlQuery;
import com.myhome.repository.rowMapper.NotificationRowMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NotificationRepositoryImpl implements NotificationRepository {

    private Logger logger = LogManager.getLogger(NotificationRepositoryImpl.class);

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NotificationRowMapper notificationRowMapper;

    @Override
    public void insertNotification(Notification notification) {
        Object[] args = {
                notification.getFrom(),
                notification.getTo(),
                notification.getSource(),
                notification.getSubject(),
                notification.getContent(),
                notification.getLogData()
        };

        int count = jdbcTemplate.update(SqlQuery.INSERT_NOTIFICATION, args);

        if (count != 0) {
            logger.info("User insert olundu");
        }
    }

    @Override
    public List<Notification> getPendingNotifications(int limit) {
        Object[] args = {limit};

        List<Notification> notifications = jdbcTemplate.query(SqlQuery.GET_PENDING_NOTIFICATIONS, args, notificationRowMapper);
        return notifications;
    }

    @Override
    public void updateNotification(Notification notification) {
        int processStatus = notification.getProcessStatus();
        long id = notification.getId();
        Object[] args = {processStatus,id};

        try{
            jdbcTemplate.update(SqlQuery.UPDATE_NOTIFICATION,args);
        }catch (Exception e){
            logger.error(e.getMessage());
            throw new RuntimeException(e);
        }

    }

}
