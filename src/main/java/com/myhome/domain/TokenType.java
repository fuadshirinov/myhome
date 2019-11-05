package com.myhome.domain;

public enum TokenType {
    ACTIVATION(0),
    RESET(1);

    private long value;

    TokenType(long value) {
        this.value = value;
    }

    public long getValue() {
        return value;
    }

    public void setValue(long value) {
        this.value = value;
    }

}
