package com.myhome.validator;

import com.myhome.form.RegistrationForm;
import com.myhome.service.CommonService;
import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import static com.myhome.validator.ValidationConstants.*;

@Component
public class RegistrationFormValidator implements Validator {

    @Autowired
    private CommonService commonService;

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass == RegistrationForm.class;
    }

    @Override
    public void validate(Object o, Errors errors) {

        RegistrationForm form = (RegistrationForm) o;
        String regexAz = "^[a-zA-ZıIiİöÖüÜəƏçÇşŞğĞ]+$";
        String regexNumbers = "^[0-9]*$";

        //Name errors
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"name","registrationForm.name.required");
        if (!errors.hasFieldErrors("name")){
            if (!GenericValidator.matchRegexp(form.getName(),regexAz)){
                errors.rejectValue("name","registrationForm.name.invalid");
            }else if (!GenericValidator.isInRange(form.getName().length(), NAME_MIN_LENGTH,NAME_MAX_LENGTH)){
                errors.rejectValue("name","registrationForm.name.length");
            }
        }

        //Surname errors
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"surname","registrationForm.surname.required");
        if (!errors.hasFieldErrors()){
            if (!GenericValidator.matchRegexp(form.getSurname(),regexAz)){
                errors.rejectValue("surname","registrationForm.surname.invalid");
            } else if (!GenericValidator.isInRange(form.getSurname().length(),SURNAME_MIN_LENGTH,SURNAME_MAX_LENGTH)){
                errors.rejectValue("surname","registrationForm.surname.length");
            }
        }

        //Email errors
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"email","registrationForm.email.required");
        if (!errors.hasFieldErrors("email")){
            if (!GenericValidator.isEmail(form.getEmail())){
                errors.rejectValue("email","registrationForm.email.invalid");
            }else if (commonService.emailIsPresent(form.getEmail())){
                errors.rejectValue("email","registrationForm.email.isUsed");
            }
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"mobile","registrationForm.mobile.required");
if (!errors.hasFieldErrors()){
    if (!GenericValidator.matchRegexp(form.getMobile(),regexNumbers)){
        errors.rejectValue("mobile","registrationForm.mobile.invalid");
    }
}
        //Password validation
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"password","registrationForm.password.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"passwordConfirmation","registrationForm.password.required");
        if (!errors.hasFieldErrors("password") && !errors.hasFieldErrors("passwordConfirmation")){
            if (!GenericValidator.isInRange(form.getPassword().length(),PASSWORD_MIN_LENGTH,PASSWORD_MAX_LENGTH)) {
                errors.rejectValue("password","registrationForm.password.length");
            }
            else {
                if (!form.getPassword().equals(form.getPasswordConfirmation())){
                    errors.rejectValue("passwordConfirmation","registrationForm.passwordConfirmation.mismatch");
                }
            }
        }
    }
}
