package com.myhome.service;

public interface EmailService {
    void sendEmail(String from, String to, String subject, String content);
}
