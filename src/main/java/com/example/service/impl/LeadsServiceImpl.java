package com.example.service.impl;

import com.example.dao.LeadsDao;
import com.example.entity.Leads;
import com.example.service.LeadsService;
import com.example.util.CurrentUserHelper;
import com.example.util.LeadsUtils;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Description:
 * Created by Floyd on 2019/2/1 18:15
 */
@Service
public class LeadsServiceImpl implements LeadsService {

    @Autowired
    private LeadsDao leadsDao;

    @Override
    public ResultData addLeads(Leads leads) {
        return leadsDao.insert(leads);
    }

    @Override
    public ResultData selectAllLeads() {
        return leadsDao.selectAllLeads();
    }

    @Override
    public ResultData selectAllPipelines() {
        return leadsDao.selectAllPipelines();
    }

    @Override
    public ResultData selectAllWatchlist() {
        return leadsDao.selectAllWatchlist();
    }

    @Override
    public ResultData selectByUid(int uid) {
        return leadsDao.selectByUid(uid);
    }

    @Override
    public ResultData updateLeads(Leads leads) {
        return leadsDao.update(leads);
    }

    @Override
    public ResultData deleteByUid(int uid) {
        return leadsDao.delete(uid);
    }

    @Override
    public ResultData fetchStatusField() {
        Map<Integer, String> status = new HashMap<>();
        status.putAll(EnumSet.allOf(LeadsUtils.LeadsStatus.class).stream().
                    collect(Collectors.toMap(LeadsUtils.LeadsStatus::getIndex, LeadsUtils.LeadsStatus::getName)));
        ResultData resultData = new ResultData();
        resultData.setResponseCode(ResponseCode.RESPONSE_OK);
        resultData.setData(status);
        return resultData;
    }

}
