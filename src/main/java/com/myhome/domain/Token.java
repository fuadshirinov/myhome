package com.myhome.domain;

public class Token extends MyHomeBase {
    private User user;
    private String value;
    private TokenType tokenType;

    public Token() {
        this.user = null;
        this.value = "";
        this.tokenType = null;
    }

    @Override
    public String toString() {
        return "Token{" +
                "user=" + user +
                ", value='" + value + '\'' +
                ", tokenType=" + tokenType +
                '}';
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public TokenType getTokenType() {
        return tokenType;
    }

    public void setTokenType(TokenType tokenType) {
        this.tokenType = tokenType;
    }
}
