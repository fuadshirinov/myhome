package com.myhome.schedule;

import com.myhome.domain.Notification;
import com.myhome.service.EmailService;
import com.myhome.service.NotificationService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class MyHomeScheduler {

    private Logger logger = LogManager.getLogger(MyHomeScheduler.class);

    @Autowired
    private EmailService emailService;

    @Autowired
    private NotificationService notificationService;

    @Scheduled(fixedRate = 5*1000)
    public void processNotificationQueue(){
        List<Notification> notifications = notificationService.getPendingNotifications(10);
        for (Notification notification : notifications){
            processEmailNotification(notification);
        }
    }

    public void processEmailNotification(Notification notification){
        // 0 - pending
        // 1 - in progress
        // 2 - success
        // 3 - error
        notification.setProcessStatus(1);
        notificationService.updateNotification(notification);
        try{
            emailService.sendEmail(notification.getFrom(),notification.getTo(),notification.getSubject(),notification.getContent());
            notification.setProcessStatus(2);
        }catch (Exception e){
            logger.error(e.getMessage());
            notification.setProcessStatus(3);
        }
        notificationService.updateNotification(notification);
    }
}
