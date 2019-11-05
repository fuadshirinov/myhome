package com.myhome.service;

import com.myhome.domain.Adv;
import com.myhome.form.AdvForm;

import java.util.List;
import java.util.Map;

public interface AdvFormValidationService {
    Map<String,List<String>> validateAdv(AdvForm adv);
}
