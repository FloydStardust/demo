package com.example.service.impl;

import com.example.dao.LeadsDao;
import com.example.entity.Leads;
import com.example.service.LeadsService;
import com.example.util.CurrentUserHelper;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description: demo
 * Created by VKC on 2019/2/1 18:15
 */
@Service
public class LeadsServiceImpl implements LeadsService {

    @Autowired
    private LeadsDao leadsDao;
    @Autowired
    private CurrentUserHelper currentUserHelper;

    @Override
    public ResultData addLeads(Leads leads) {
        return leadsDao.insert(leads);
    }

    @Override
    public ResultData selectAllLeads() {
        return null;
    }

    @Override
    public ResultData selectAllPipelines() {
        return null;
    }

    @Override
    public ResultData selectAllWatchlist() {
        return null;
    }

    @Override
    public ResultData selectByUid(int uid) {
        return null;
    }

    @Override
    public ResultData updateLeads(Leads leads) {
        return null;
    }

    @Override
    public ResultData deleteByUid(int uid) {
        return null;
    }
}
