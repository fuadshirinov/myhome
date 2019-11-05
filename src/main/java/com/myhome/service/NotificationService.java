package com.myhome.service;

import com.myhome.domain.Notification;

import java.util.List;

public interface NotificationService {
    void insertNotification(Notification notification);
    List<Notification> getPendingNotifications(int limit);
    void updateNotification(Notification notification);
}
