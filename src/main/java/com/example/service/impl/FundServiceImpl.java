package com.example.service.impl;

import com.example.dao.FundDao;
import com.example.entity.Fund;
import com.example.service.FundService;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

/**
 * Description: demo
 * Created by VKC on 2019/2/10 16:47
 */
@Service
public class FundServiceImpl implements FundService {

    @Autowired
    private FundDao fundDao;

    @Override
    public ResultData addFund(Fund fund) {
        return fundDao.insert(fund);
    }

    @Override
    public ResultData updateFund(Fund fund) {
        return null;
    }

    @Override
    public ResultData deleteFund(int uid) {
        return null;
    }

    @Override
    public ResultData fetchFund(int uid) {
        return fundDao.selectByUid(uid);
    }

    @Override
    public ResultData fetchAllFund() {
        Map<String, Object> condition = new HashMap<>();
        return fundDao.select(condition);
    }

    @Override
    public ResultData fetchAllFundBriefInfo() {
        Map<String, Object> condition = new HashMap<>();
        ResultData resultData = fundDao.select(condition);
        ResultData result = new ResultData();

        if(resultData.getResponseCode() == ResponseCode.RESPONSE_OK){
            List<Fund> allFunds = (List<Fund>) resultData.getData();
            Map<Integer, String> briefInfo = allFunds.stream().collect(Collectors.toMap(Fund::getUid, Fund::getName));
            result.setResponseCode(ResponseCode.RESPONSE_OK);
            result.setData(briefInfo);
        } else {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
        }
        return result;
    }
}
