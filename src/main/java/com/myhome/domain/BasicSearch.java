package com.myhome.domain;

import java.math.BigDecimal;

public class BasicSearch {

    private Integer type;
    private Long estateId;
    private Integer condition;
    private Integer roomMin;
    private Integer roomMax;
    private BigDecimal priceMin;
    private BigDecimal priceMax;
    private BigDecimal squareMin;
    private BigDecimal squareMax;
    private Long cityId;


    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Long getEstateId() {
        return estateId;
    }

    public void setEstateId(Long estateId) {
        this.estateId = estateId;
    }

    public Integer getCondition() {
        return condition;
    }

    public void setCondition(Integer condition) {
        this.condition = condition;
    }

    public Integer getRoomMin() {
        return roomMin;
    }

    public void setRoomMin(Integer roomMin) {
        this.roomMin = roomMin;
    }

    public Integer getRoomMax() {
        return roomMax;
    }

    public void setRoomMax(Integer roomMax) {
        this.roomMax = roomMax;
    }

    public BigDecimal getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(BigDecimal priceMin) {
        this.priceMin = priceMin;
    }

    public BigDecimal getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(BigDecimal priceMax) {
        this.priceMax = priceMax;
    }

    public BigDecimal getSquareMin() {
        return squareMin;
    }

    public void setSquareMin(BigDecimal squareMin) {
        this.squareMin = squareMin;
    }

    public BigDecimal getSquareMax() {
        return squareMax;
    }

    public void setSquareMax(BigDecimal squareMax) {
        this.squareMax = squareMax;
    }

    public Long getCityId() {
        return cityId;
    }

    public void setCityId(Long cityId) {
        this.cityId = cityId;
    }

    @Override
    public String toString() {
        return "BasicSearch{" +
                "type=" + type +
                ", estateId=" + estateId +
                ", condition=" + condition +
                ", roomMin=" + roomMin +
                ", roomMax=" + roomMax +
                ", priceMin=" + priceMin +
                ", priceMax=" + priceMax +
                ", squareMin=" + squareMin +
                ", squareMax=" + squareMax +
                ", cityId=" + cityId +
                '}';
    }
}