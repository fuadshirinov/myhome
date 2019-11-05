package com.myhome.service.impl;

import com.myhome.domain.Adv;
import com.myhome.domain.BasicSearch;
import com.myhome.domain.DataTableResult;
import com.myhome.repository.AdvRepository;
import com.myhome.service.AdvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;


@Service
public class AdvServiceImpl implements AdvService {


    @Autowired
    private AdvRepository advRepository;

    @Override
    public void addAdv(Adv adv, long userID) {
        advRepository.addAdv(adv, userID);
    }

    @Override
    public DataTableResult getAdvAjax(long userID, int processStatus, int draw, int start, int length) {
        DataTableResult result = new DataTableResult();

        result.setDraw(draw);
        int advCount = advRepository.getAdvCount(userID, processStatus);
        result.setRecordsTotal(advCount);
        result.setRecordsFiltered(advCount);

        List<Adv> advList = advRepository.getAdvAjax(userID, processStatus, start, length);
        Object[][] data = new Object[advList.size()][8];


        int counter = 0;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy hh:mm:ss");
        for (Adv adv : advList) {
            data[counter][0] = adv.getId();
            data[counter][1] = adv.getType();
            data[counter][2] = adv.getCondition().getName();
            data[counter][3] = adv.getPrice();
            data[counter][4] = adv.getCurrency().getName();
            data[counter][5] = adv.getCity().getName();
            data[counter][6] = adv.getIdate().format(formatter);
            data[counter][7] = "<a href=adv-detail?id=" + adv.getId() + "><button  class=\"btn\" style=\"background-color:purple\">Bax</button></a>";
            counter++;
        }
        result.setData(data);
        return result;
    }

    @Override
    public Optional<Adv> getAdvById(long advId) {
        return advRepository.getAdvById(advId);
    }

    @Override
    public boolean deleteAdvByUserId(long userID) {
        Object[] args = {userID};
        return advRepository.deleteAdvByUserId(userID);
    }

    @Override
    public DataTableResult getAdvForAdminDatatable(int processStatus, int draw, int start, int length) {

        DataTableResult result = new DataTableResult();
        result.setDraw(draw);
        result.setRecordsTotal(advRepository.advCountForAdminDatatable(processStatus));
        result.setRecordsFiltered(advRepository.advCountForAdminDatatable(processStatus));
        List<Adv> list = advRepository.getAdvsForAdminDatatable(processStatus, draw, start, length);

        Object[][] data = new Object[list.size()][10];
        int counter = 0;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy hh:mm");
        for (Adv adv : list) {
            data[counter][0] = adv.getId();
            data[counter][1] = adv.getType();
            data[counter][2] = adv.getEstate().getName();
            data[counter][3] = adv.getPrice();
            data[counter][4] = adv.getCurrency().getName();
            data[counter][5] = adv.getCity().getName();
            data[counter][6] = adv.getIdate().format(formatter);
            if (adv.getProcessStatus() == 0) {
                data[counter][7] = "<button style='background-color:green;color:white;cursor:pointer' class='btn' id='confirm-adv' onclick='confirmadv(" + adv.getId() + ")'>Təsdiq et</button>";
            }else{
                data[counter][7] = "<p>Tesdiqlenib</p>";
            }
            data[counter][8] = "<button style='background-color:red;color:white;cursor:pointer' class='btn' id='delete-adv' onclick='deleteAdv(" + adv.getId() + ")'>Ləğv et</button>";
            data[counter][9] = "<a href=adv-detail?id=" + adv.getId() + "><button  class=\"btn\" style=\"background-color:yellow;cursor:pointer\">Bax</button></a>";
            counter++;
        }
        result.setData(data);
        return result;
    }

    @Override
    public boolean activateAdv(long advID) {
        return advRepository.activateAdv(advID);
    }

    @Override
    public boolean deleteAdv(long advID) {
        return advRepository.deleteAdv(advID);
    }

    @Override
    public List<Adv> advListByUserId(long userID) {
        return advRepository.getAdvListByUserID(userID);
    }

    @Override
    public List<Adv> getAdvByCount(int count) {
        return advRepository.getAdvByCount(count);
    }

    @Override
    public List<Adv> basicSearch(BasicSearch basicSearch) {
        return advRepository.basicSearch(basicSearch);
    }

    @Override
    public int basicSearchResultCount(BasicSearch basicSearch) {
        return advRepository.basicSearchResultCount(basicSearch);
    }

    @Override
    public int getAllAdvsCount() {
        return advRepository.allAdvCount();
    }

    @Override
    public int getPendingAdvsCount() {
        return advRepository.allPendingAdvCount();
    }


}
