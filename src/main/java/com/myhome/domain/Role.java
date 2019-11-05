package com.myhome.domain;

public enum Role {
    USER(1),
    ADMIN(2);

    private String name;
    private long id;
    private String successPage;

    Role(int id) {
        this.id = id;
    }

    Role(int id, String successPage) {
        this.id = id;
        this.successPage = successPage;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSuccessPage() {
        return successPage;
    }

    public void setSuccessPage(String successPage) {
        this.successPage = successPage;
    }

    public static Role fromId(int id) {
        Role r = null;

        if (id == 1) {
            r = Role.USER;
        } else if (id == 2){
            r = Role.ADMIN;
        }else {
            throw new IllegalArgumentException("Unknown user role id " + id);
        }

        return r;
    }

    @Override
    public String toString() {
        return "Role{" +
                "name='" + name + '\'' +
                ", id=" + id +
                ", successPage='" + successPage + '\'' +
                '}';
    }
}
