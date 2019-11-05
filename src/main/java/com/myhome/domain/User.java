package com.myhome.domain;

import java.util.List;

public class User extends MyHomeBase {

    private String name;
    private String surname;
    private String email;
    private String mobile;
    private String password;
    private int processStatus;
    private List<Role> roleList;

    public User() {
        this.name = "";
        this.surname = "";
        this.email = "";
        this.mobile = "";
        this.password = "";
        this.processStatus = 0;
        this.roleList = null;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getProcessStatus() {
        return processStatus;
    }

    public void setProcessStatus(int processStatus) {
        this.processStatus = processStatus;
    }

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", email='" + email + '\'' +
                ", mobile='" + mobile + '\'' +
                ", password='" + password + '\'' +
                ", processStatus=" + processStatus +
                ", roleList=" + roleList +
                '}';
    }
}
