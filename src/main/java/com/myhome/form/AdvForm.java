package com.myhome.form;

import org.springframework.web.multipart.MultipartFile;

public class AdvForm {

    private String type;
    private String cityId;
    private String estateId;
    private String document;
    private String condition;
    private String fullAddress;
    private String room;
    private String square;
    private String floor;
    private String detail;
    private String phone;
    private String wifi;
    private String tv;
    private String conditioner;
    private String heating;
    private String price;
    private String currencyId;
    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getSquare() {
        return square;
    }

    public void setSquare(String square) {
        this.square = square;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCityId() {
        return cityId;
    }

    public void setCityId(String cityId) {
        this.cityId = cityId;
    }

    public String getEstateId() {
        return estateId;
    }

    public void setEstateId(String estateId) {
        this.estateId = estateId;
    }

    public String getDocument() {
        return document;
    }

    public void setDocument(String document) {
        this.document = document;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWifi() {
        return wifi;
    }

    public void setWifi(String wifi) {
        this.wifi = wifi;
    }

    public String getTv() {
        return tv;
    }

    public void setTv(String tv) {
        this.tv = tv;
    }

    public String getConditioner() {
        return conditioner;
    }

    public void setConditioner(String conditioner) {
        this.conditioner = conditioner;
    }

    public String getHeating() {
        return heating;
    }

    public void setHeating(String heating) {
        this.heating = heating;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCurrencyId() {
        return currencyId;
    }

    public void setCurrencyId(String currencyId) {
        this.currencyId = currencyId;
    }

    @Override
    public String toString() {
        return "AdvForm{" +
                "type='" + type + '\'' +
                ", cityId='" + cityId + '\'' +
                ", estateId='" + estateId + '\'' +
                ", document='" + document + '\'' +
                ", condition='" + condition + '\'' +
                ", fullAddress='" + fullAddress + '\'' +
                ", room='" + room + '\'' +
                ", square='" + square + '\'' +
                ", floor='" + floor + '\'' +
                ", detail='" + detail + '\'' +
                ", phone='" + phone + '\'' +
                ", wifi='" + wifi + '\'' +
                ", tv='" + tv + '\'' +
                ", conditioner='" + conditioner + '\'' +
                ", heating='" + heating + '\'' +
                ", price='" + price + '\'' +
                ", currencyId='" + currencyId + '\'' +
                '}';
    }
}
