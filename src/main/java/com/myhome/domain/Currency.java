package com.myhome.domain;

public class Currency extends MyHomeBase {
    private String name;

    public Currency() {
        this.name = "";
    }

    @Override
    public String toString() {
        return "Currency{" +
                "name='" + name + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
