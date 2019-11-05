package com.myhome.repository.rowMapper;

import com.myhome.domain.*;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class AdvRowMapper implements RowMapper<Adv> {
    @Override
    public Adv mapRow(ResultSet resultSet, int i) throws SQLException {

        Adv adv = new Adv();
        adv.setId(resultSet.getLong("id"));
        adv.setCity(new City());
        adv.getCity().setId(resultSet.getLong("city_id"));
        adv.getCity().setName(resultSet.getString("city_name"));
        adv.setPrice(resultSet.getBigDecimal("price"));
        adv.setCurrency(new Currency());
        adv.getCurrency().setId(resultSet.getLong("currency_id"));
        adv.getCurrency().setName(resultSet.getString("currency_name"));
        adv.setMedia(new Media());
        adv.getMedia().setFilename(resultSet.getString("file_name"));
        adv.setType(Type.fromValue(resultSet.getInt("elan_type")));
        if (resultSet.getInt("elan_type") == 0) {
            adv.getType().setName("Satılır");
        } else if (resultSet.getInt("elan_type") == 1) {
            adv.getType().setName("Kiraye");
        }

        adv.setEstate(new Estate());
        adv.getEstate().setId(resultSet.getLong("estate_id"));
        adv.getEstate().setName(resultSet.getString("estate_name"));
        adv.setRoom(resultSet.getInt("room_count"));
        adv.setSquare(resultSet.getBigDecimal("square"));
        adv.setFloor(resultSet.getInt("floor"));
        if (resultSet.getInt("document") == 0) {
            adv.setDocument(false);
        } else {
            adv.setDocument(true);
        }
        adv.setFullAddress(resultSet.getString("full_address"));
        if (resultSet.getString("description") != null) {
            adv.setDetail(resultSet.getString("description"));
        }
        adv.setStatus(resultSet.getInt("status"));
        adv.setProcessStatus(resultSet.getInt("process_status"));
        adv.setIdate(resultSet.getTimestamp("idate").toLocalDateTime());
        if (resultSet.getTimestamp("udate") != null) {
            adv.setUdate(resultSet.getTimestamp("udate").toLocalDateTime());
        }
        if (resultSet.getInt("wifi") == 0) {
            adv.setWifi(false);
        } else {
            adv.setWifi(true);
        }
        if (resultSet.getInt("phone") == 0) {
            adv.setPhone(false);
        } else {
            adv.setPhone(true);
        }
        if (resultSet.getInt("tv") == 0) {
            adv.setTv(false);
        } else {
            adv.setTv(true);
        }
        if (resultSet.getInt("conditioner") == 0) {
            adv.setConditioner(false);
        } else {
            adv.setConditioner(true);
        }
        if (resultSet.getInt("heating") == 0) {
            adv.setHeating(false);
        } else {
            adv.setHeating(true);
        }
        adv.setCondition(Condition.fromValue(resultSet.getInt("condition")));
        if (adv.getCondition().getValue() == 0){
            adv.getCondition().setName("Yeni");
        }
        else if (adv.getCondition().getValue() == 1){
            adv.getCondition().setName("Köhnə");
        }

        return adv;
    }
}
