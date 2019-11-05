package com.myhome.service;

import com.myhome.domain.Adv;
import com.myhome.domain.BasicSearch;
import com.myhome.domain.DataTableResult;

import java.util.List;
import java.util.Optional;

public interface AdvService {
    void addAdv(Adv adv, long userID);

    DataTableResult getAdvAjax(long UserID, int processStatus, int draw, int start, int length);

    Optional<Adv> getAdvById(long advId);

    boolean deleteAdvByUserId(long userID);

    DataTableResult getAdvForAdminDatatable(int processStatus, int draw, int start, int length);

    boolean activateAdv(long advID);

    boolean deleteAdv(long advID);

    List<Adv> advListByUserId(long userID);

    List<Adv> getAdvByCount(int count);

    List<Adv> basicSearch(BasicSearch basicSearch);

    int basicSearchResultCount(BasicSearch basicSearch);

    int getAllAdvsCount();

    int getPendingAdvsCount();
}
