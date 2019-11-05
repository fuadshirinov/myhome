package com.myhome.repository;
import com.myhome.domain.Adv;
import com.myhome.domain.BasicSearch;
import com.myhome.domain.DataTableResult;
import com.myhome.domain.User;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

public interface AdvRepository {
    void addAdv(Adv adv,long userID);
    int getAdvCount(long userID,int processStatus);
    List<Adv> getAdvAjax(long userID,int processStatus,int start,int length);
    Optional<Adv> getAdvById(long advId);
    boolean deleteAdvByUserId(long userID);
    List<Adv> getAdvsForAdminDatatable(int processStatus,int draw,int start,int length);
    int advCountForAdminDatatable(int processStatus);
    boolean activateAdv(long advID);
    boolean deleteAdv(long advID);
    List<Adv> getAdvListByUserID(long userID);
    List<Adv> getAdvByCount(int count);
    List<Adv> basicSearch (BasicSearch basicSearch);
    int basicSearchResultCount(BasicSearch basicSearch);
    int allAdvCount();
    int allPendingAdvCount();
}
