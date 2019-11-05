package com.myhome.domain;


import java.math.BigDecimal;

public class Adv extends MyHomeBase {
    private City city;
    private Type type;
    private Estate estate;
    private boolean document;
    private Condition condition;
    private String fullAddress;
    private int room;
    private BigDecimal square;
    private int floor;
    private String detail;
    private boolean phone;
    private boolean wifi;
    private boolean tv;
    private boolean conditioner;
    private boolean heating;
    private Media media;
    private BigDecimal price;
    private Currency currency;
    private int processStatus;

    public Adv() {
        this.city = null;
        this.type = null;
        this.estate = null;
        this.document = true;
        this.condition = null;
        this.fullAddress = "";
        this.room = 0;
        this.square = BigDecimal.ZERO;
        this.floor = 0;
        this.detail = "";
        this.phone = true;
        this.wifi = true;
        this.tv = true;
        this.conditioner = true;
        this.heating = true;
        this.media = null;
        this.price = BigDecimal.ZERO;
        this.currency = null;
        this.media = null;
        this.processStatus = 0;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Estate getEstate() {
        return estate;
    }

    public void setEstate(Estate estate) {
        this.estate = estate;
    }

    public boolean isDocument() {
        return document;
    }

    public void setDocument(boolean document) {
        this.document = document;
    }

    public Condition getCondition() {
        return condition;
    }

    public void setCondition(Condition condition) {
        this.condition = condition;
    }

    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }

    public BigDecimal getSquare() {
        return square;
    }

    public void setSquare(BigDecimal square) {
        this.square = square;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public boolean isPhone() {
        return phone;
    }

    public void setPhone(boolean phone) {
        this.phone = phone;
    }

    public boolean isWifi() {
        return wifi;
    }

    public void setWifi(boolean wifi) {
        this.wifi = wifi;
    }

    public boolean isTv() {
        return tv;
    }

    public void setTv(boolean tv) {
        this.tv = tv;
    }

    public boolean isConditioner() {
        return conditioner;
    }

    public void setConditioner(boolean conditioner) {
        this.conditioner = conditioner;
    }

    public boolean isHeating() {
        return heating;
    }

    public void setHeating(boolean heating) {
        this.heating = heating;
    }

    public Media getMedia() {
        return media;
    }

    public void setMedia(Media media) {
        this.media = media;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Currency getCurrency() {
        return currency;
    }

    public void setCurrency(Currency currency) {
        this.currency = currency;
    }

    public int getProcessStatus() {
        return processStatus;
    }

    public void setProcessStatus(int processStatus) {
        this.processStatus = processStatus;
    }

    @Override
    public String toString() {
        return "Adv{" +
                "city=" + city +
                ", type=" + type +
                ", estate=" + estate +
                ", document=" + document +
                ", condition=" + condition +
                ", fullAddress='" + fullAddress + '\'' +
                ", room=" + room +
                ", square=" + square +
                ", floor=" + floor +
                ", detail='" + detail + '\'' +
                ", phone=" + phone +
                ", wifi=" + wifi +
                ", tv=" + tv +
                ", conditioner=" + conditioner +
                ", heating=" + heating +
                ", media=" + media +
                ", price=" + price +
                ", currency=" + currency +
                '}';
    }
}
