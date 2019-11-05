package com.myhome.util;

import com.myhome.domain.Adv;
import com.myhome.domain.Condition;
import com.myhome.domain.Type;
import com.myhome.domain.User;
import com.myhome.form.AdvForm;
import com.myhome.form.RegistrationForm;
import org.springframework.security.crypto.bcrypt.BCrypt;

import java.math.BigDecimal;

public class FormConverter {
    public static void convertToAdv(AdvForm advForm,Adv adv){

        adv.setType(Type.fromValue(Integer.parseInt(advForm.getType())));
        adv.getCity().setId(Long.parseLong(advForm.getCityId()));
        adv.getEstate().setId(Long.parseLong(advForm.getEstateId()));
        adv.setDocument(Boolean.parseBoolean(advForm.getDocument()));
        adv.setCondition(Condition.fromValue(Integer.parseInt(advForm.getCondition())));
        adv.setFullAddress(advForm.getFullAddress());
        adv.setRoom(Integer.parseInt(advForm.getRoom()));
        adv.setSquare(new BigDecimal(advForm.getSquare()));
        if (!advForm.getFloor().isEmpty()){
            adv.setFloor(Integer.parseInt(advForm.getFloor()));
        }
        adv.setDetail(advForm.getDetail());
        adv.setPhone(Boolean.parseBoolean(advForm.getPhone()));
        adv.setWifi(Boolean.parseBoolean(advForm.getWifi()));
        adv.setTv(Boolean.parseBoolean(advForm.getTv()));
        adv.setConditioner(Boolean.parseBoolean(advForm.getConditioner()));
        adv.setHeating(Boolean.parseBoolean(advForm.getHeating()));
        adv.setPrice(new BigDecimal(advForm.getPrice()));
        adv.getCurrency().setId(Long.parseLong(advForm.getCurrencyId()));
    }

    public static User fromFormToUser(RegistrationForm form){
        User user = new User();
        user.setName(form.getName());
        user.setSurname(form.getSurname());
        user.setEmail(form.getEmail());
        user.setMobile(form.getMobile());
        String hashed = BCrypt.hashpw(form.getPassword(),BCrypt.gensalt(10));
        user.setPassword(hashed);
        return user;
    }

    public static RegistrationForm fromUserToRegisterForm(User user){
        RegistrationForm form = new RegistrationForm();
        form.setName(user.getName());
        form.setSurname(user.getSurname());
        form.setEmail(user.getEmail());
        form.setMobile(user.getMobile());
        return form;
    }
}
