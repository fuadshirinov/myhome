package com.myhome.repository;

import com.myhome.domain.Notification;

import java.util.List;

public interface NotificationRepository {
    void insertNotification(Notification notification);
    List<Notification> getPendingNotifications(int limit);
    void updateNotification(Notification notification);
}
