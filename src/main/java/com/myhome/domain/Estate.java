package com.myhome.domain;

public class Estate extends MyHomeBase {
    private String name;

    public Estate() {
        this.name = "";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Estate{" +
                "name='" + name + '\'' +
                '}';
    }
}
