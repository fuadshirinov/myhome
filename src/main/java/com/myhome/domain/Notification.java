package com.myhome.domain;

public class Notification extends MyHomeBase {
    private String from;
    private String to;
    private String subject;
    private String content;
    private String source;
    private String logData;
    private int processStatus;

    public Notification() {
        this.from = "";
        this.to = "";
        this.subject = "";
        this.content = "";
        this.source = "";
        this.logData = "";
        this.processStatus = 0;
    }

    public String getLogData() {
        return logData;
    }

    public void setLogData(String logData) {
        this.logData = logData;
    }

    public int getProcessStatus() {
        return processStatus;
    }

    public void setProcessStatus(int processStatus) {
        this.processStatus = processStatus;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    @Override
    public String toString() {
        return "Notification{" +
                "from='" + from + '\'' +
                ", to='" + to + '\'' +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                ", source='" + source + '\'' +
                ", logData='" + logData + '\'' +
                ", processStatus=" + processStatus +
                '}';
    }
}
