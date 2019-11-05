package com.myhome.service.impl;

import com.myhome.domain.Notification;
import com.myhome.repository.NotificationRepository;
import com.myhome.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NotificationServiceImpl implements NotificationService {

    @Autowired
    NotificationRepository notificationRepository;

    @Override
    public void insertNotification(Notification notification) {
        notificationRepository.insertNotification(notification);
    }

    @Override
    public List<Notification> getPendingNotifications(int limit) {
        return notificationRepository.getPendingNotifications(limit);
    }

    @Override
    public void updateNotification(Notification notification) {
        notificationRepository.updateNotification(notification);
    }
}
