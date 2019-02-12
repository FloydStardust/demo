package com.example.service;

import com.example.entity.Fund;
import com.example.util.ResultData;

/**
 * Description: demo
 * Created by VKC on 2019/2/10 16:44
 */
public interface FundService {

    ResultData addFund(Fund fund);

    ResultData updateFund(Fund fund);

    ResultData deleteFund(int uid);

    ResultData fetchFund(int uid);

    ResultData fetchAllFund();

    ResultData fetchAllFundBriefInfo();
}
