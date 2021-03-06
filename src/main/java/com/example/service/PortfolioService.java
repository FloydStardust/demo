package com.example.service;

import com.example.entity.Portfolio;
import com.example.form.ScheduleQueryParam;
import com.example.util.ResultData;

/**
 * Description: portfolio service
 * Created by Floyd on 2019/2/10 16:32
 */
public interface PortfolioService {

    ResultData addPortfolio(Portfolio portfolio);

    ResultData deletePortfolio(int uid);

    ResultData updatePortfolio(Portfolio portfolio);

    ResultData getPortfolio(int uid);

    ResultData fetchAllPortfolio();

    ResultData getAddPortfolioFields();

    ResultData getProfit(int uid);

    ResultData getBalance(int uid);

    ResultData getProfitSummary(int uid);

    ResultData getBalanceSummary(int uid);
}
