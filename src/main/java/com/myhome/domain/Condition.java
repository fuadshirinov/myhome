package com.myhome.domain;

public enum Condition {
    YENI(0),
    KOHNE(1);
    private int value;
    private String name;

    Condition(int value) {
        this.value = value;
    }

    public static Condition fromValue(int value){
        Condition c = null;
        if (value == 0){
            c = Condition.YENI;
        }
        else if (value == 1){
            c = Condition.KOHNE;
        }

        return c;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
