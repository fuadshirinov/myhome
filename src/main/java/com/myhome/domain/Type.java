package com.myhome.domain;

public enum Type {

    SATILIR(0),
    KIRAYE(1);

   private int value;
   private String name;

    Type(int value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public static Type fromValue(int value){
        Type t = null;
        if (value == 0){
            t = Type.SATILIR;
        }
        else if (value == 1){
            t = Type.KIRAYE;
        }

        return t;
    }

}
