package com.myhome.service.impl;

import com.myhome.form.AdvForm;
import com.myhome.service.AdvFormValidationService;
import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdvFormFormValidationServiceImpl implements AdvFormValidationService {


    @Value("${adv.error.required}")
    private String required;

    @Value("${adv.error.number-format.invalid}")
    private String numberFormatInvalid;


    @Override
    public Map<String, List<String>> validateAdv(AdvForm adv) {
        Map<String, List<String>> errors = new HashMap<>();
        String numbers = "^[0-9]*$";

        //Adv type errors
        List<String> advTypeErrors = new ArrayList<>();
        if (adv.getType().equals("-1")) {
            System.out.println(adv.getType());
            advTypeErrors.add(required);
        }
        if (!advTypeErrors.isEmpty()) {
            errors.put("advType", advTypeErrors);
        }

        //Estate type errors
        List<String> estateTypeErrors = new ArrayList<>();
        if (adv.getEstateId().equals("-1")) {
            estateTypeErrors.add(required);
        }
        if (!estateTypeErrors.isEmpty()) {
            errors.put("estateType", estateTypeErrors);
        }

        //Document errors
        List<String> documentErrors = new ArrayList<>();
        if (adv.getDocument().equals("-1")) {
            documentErrors.add(required);
        }
        if (!documentErrors.isEmpty()) {
            errors.put("document", documentErrors);
        }
        //condition errors
        List<String> conditionErrors = new ArrayList<>();
        if (adv.getCondition().equals("-1")) {
            conditionErrors.add(required);
        }
        if (!conditionErrors.isEmpty()) {
            errors.put("condition", conditionErrors);
        }

        //city errors
        List<String> cityErrors = new ArrayList<>();
        if (adv.getCityId().equals("-1")) {
            cityErrors.add(required);
        }
        if (!cityErrors.isEmpty()) {
            errors.put("city", cityErrors);
        }

        //address errors
        List<String> addressErrors = new ArrayList<>();
        if (GenericValidator.isBlankOrNull(adv.getFullAddress())) {
            addressErrors.add(required);
        }
        if (!addressErrors.isEmpty()) {
            errors.put("address", addressErrors);
        }

        //room errors
        List<String> roomErrors = new ArrayList<>();
        if (GenericValidator.isBlankOrNull(adv.getRoom())) {
            roomErrors.add(required);
        }
        if (!GenericValidator.matchRegexp(adv.getRoom(), numbers)) {
            roomErrors.add(numberFormatInvalid);
        }
        if (!roomErrors.isEmpty()) {
            errors.put("room", roomErrors);
        }

        //square errors
        List<String> squareErrors = new ArrayList<>();
        if (GenericValidator.isBlankOrNull(adv.getSquare())) {
            squareErrors.add(required);
        }
        if (!GenericValidator.matchRegexp(adv.getSquare(), numbers)) {
            squareErrors.add(numberFormatInvalid);
        }
        if (!squareErrors.isEmpty()) {
            errors.put("square", squareErrors);
        }

        //floor errors
        List<String> floorErrors = new ArrayList<>();
        if (!GenericValidator.matchRegexp(adv.getFloor(), numbers)) {
            floorErrors.add(numberFormatInvalid);
        }
        if (!floorErrors.isEmpty()) {
            errors.put("floor", floorErrors);
        }
        //wifi errors
        List<String> wifiErrors = new ArrayList<>();
        if (adv.getWifi().equals("-1")) {
            wifiErrors.add(required);
        }
        if (!wifiErrors.isEmpty()) {
            errors.put("wifi", wifiErrors);
        }

        //tv
        List<String> tvErrors = new ArrayList<>();
        if (adv.getTv().equals("-1")) {
            tvErrors.add(required);
        }
        if (!tvErrors.isEmpty()) {
            errors.put("tv", tvErrors);
        }

        //phone
        List<String> phoneErrors = new ArrayList<>();
        if (adv.getPhone().equals("-1")) {
            phoneErrors.add(required);
        }
        if (!phoneErrors.isEmpty()) {
            errors.put("phone", phoneErrors);
        }

        //conditioner
        List<String> conditionerErrors = new ArrayList<>();
        if (adv.getConditioner().equals("-1")) {
            conditionerErrors.add(required);
        }
        if (!conditionerErrors.isEmpty()) {
            errors.put("conditioner", conditionerErrors);
        }

        //heating
        List<String> heatingErrors = new ArrayList<>();
        if (adv.getHeating().equals("-1")) {
            heatingErrors.add(required);
        }
        if (!heatingErrors.isEmpty()) {
            errors.put("heating", heatingErrors);
        }

        //details
        List<String> detailErrors = new ArrayList<>();
        if (GenericValidator.isBlankOrNull(adv.getDetail())) {
            detailErrors.add(required);
        }
        if (!detailErrors.isEmpty()) {
            errors.put("detail", detailErrors);
        }

        //price
        List<String> priceErrors = new ArrayList<>();
        if (GenericValidator.isBlankOrNull(adv.getPrice())) {
            priceErrors.add(required);
            if (!GenericValidator.matchRegexp(adv.getPrice(), numbers)) {
                priceErrors.add(numberFormatInvalid);
            }
        }
        if (!priceErrors.isEmpty()) {
            errors.put("price", priceErrors);
        }

        return errors;
    }
}
