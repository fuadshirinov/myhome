package com.myhome.domain;

import java.time.LocalDateTime;

public class MyHomeBase {
    private long id;
    private int status;
    private LocalDateTime idate;
    private LocalDateTime udate;

    public MyHomeBase() {
        this.id = 0;
        this.status = 1;
        this.idate = null;
        this.udate = null;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public LocalDateTime getIdate() {
        return idate;
    }

    public void setIdate(LocalDateTime idate) {
        this.idate = idate;
    }

    public LocalDateTime getUdate() {
        return udate;
    }

    public void setUdate(LocalDateTime udate) {
        this.udate = udate;
    }

    @Override
    public String toString() {
        return "MyHomeBase{" +
                "id=" + id +
                ", status=" + status +
                ", idate=" + idate +
                ", udate=" + udate +
                '}';
    }
}
