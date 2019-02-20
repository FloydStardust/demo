package com.example.service.impl;

import com.example.dao.BalanceSheetDao;
import com.example.dao.FundDao;
import com.example.dao.PortfolioDao;
import com.example.dao.ProfitDao;
import com.example.entity.Fund;
import com.example.entity.Portfolio;
import com.example.service.PortfolioService;
import com.example.util.PortfolioUtils;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import com.example.vo.AddPortfolioFieldsVo;
import com.example.vo.PortfolioVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Description: demo
 * Created by Floyd on 2019/2/10 16:36
 */
@Service
public class PortfolioServiceImpl implements PortfolioService {

    @Autowired
    private FundDao fundDao;
    @Autowired
    private PortfolioDao portfolioDao;
    @Autowired
    private ProfitDao profitDao;
    @Autowired
    private BalanceSheetDao balanceSheetDao;

    @Override
    public ResultData addPortfolio(Portfolio portfolio) {
        return portfolioDao.insert(portfolio);
    }

    @Override
    public ResultData deletePortfolio(int uid) {
        return portfolioDao.delete(uid);
    }

    @Override
    public ResultData updatePortfolio(Portfolio portfolio) {
        return null;
    }

    @Override
    public ResultData fetchPortfolio(int uid) {
        return portfolioDao.selectByUid(uid);
    }

    @Override
    public ResultData fetchAllPortfolio() {
        ResultData result = new ResultData();
        Map<String, Object> condition = new HashMap<>();
        ResultData resultData = portfolioDao.select(condition);
        if(resultData.getResponseCode() == ResponseCode.RESPONSE_OK){
            List<PortfolioVo> portfolioVos = new ArrayList<>();
            for(Portfolio item: (List<Portfolio>)resultData.getData()){
                PortfolioVo portfolioVo = new PortfolioVo(item);
                portfolioVo.setFundName(getFundNameById(item.getUid()));
                portfolioVos.add(portfolioVo);
            }
            result.setResponseCode(ResponseCode.RESPONSE_OK);
            result.setData(portfolioVos);
        } else {
            System.out.println(resultData.getDescription());
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription("Dao Layer Error...");
        }
        return result;
    }

    @Override
    public ResultData getAddPortfolioFields() {
        ResultData result = new ResultData();
        Map<String, Object> condition = new HashMap<>();
        ResultData allFunds = fundDao.select(condition);

        if(allFunds.getResponseCode() == ResponseCode.RESPONSE_OK){
            AddPortfolioFieldsVo addPortfolioFieldsVo = new AddPortfolioFieldsVo();
            List<Fund> list = (List<Fund>) allFunds.getData();
            Map<Integer, String> briefInfo = list.stream().collect(Collectors.toMap(Fund::getUid, Fund::getName));

            addPortfolioFieldsVo.setFunds(briefInfo);
            addPortfolioFieldsVo.setIPOStatus(PortfolioUtils.IPO_STATUS);
            addPortfolioFieldsVo.setInvestType( EnumSet.allOf(PortfolioUtils.InvestType.class).stream().
                    collect(Collectors.toMap(PortfolioUtils.InvestType::getIndex, PortfolioUtils.InvestType::getName)));
            addPortfolioFieldsVo.setShareType( EnumSet.allOf(PortfolioUtils.ShareType.class).stream().
                    collect(Collectors.toMap(PortfolioUtils.ShareType::getIndex, PortfolioUtils.ShareType::getName)));
            addPortfolioFieldsVo.setExitStatus( EnumSet.allOf(PortfolioUtils.ExitStatus.class).stream().
                    collect(Collectors.toMap(PortfolioUtils.ExitStatus::getIndex, PortfolioUtils.ExitStatus::getName)));
            addPortfolioFieldsVo.setMoneyType( EnumSet.allOf(PortfolioUtils.MoneyType.class).stream().
                    collect(Collectors.toMap(PortfolioUtils.MoneyType::getIndex, PortfolioUtils.MoneyType::getName)));
            addPortfolioFieldsVo.setExitType( EnumSet.allOf(PortfolioUtils.ExitTye.class).stream().
                    collect(Collectors.toMap(PortfolioUtils.ExitTye::getIndex, PortfolioUtils.ExitTye::getName)));

            result.setData(addPortfolioFieldsVo);
            result.setResponseCode(ResponseCode.RESPONSE_OK);
        } else {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
        }
        return result;
    }

    @Override
    public ResultData getProfit(int uid) {
        ResultData resultData = new ResultData();
        Map<String, Object> conditions = new HashMap<>();
        ResultData daoResult = profitDao.select(conditions);

        return null;
    }

    @Override
    public ResultData getBalance(int uid) {
        return null;
    }

    private String getFundNameById(int id){
        ResultData resultData = fundDao.selectByUid(id);
        if(resultData.getResponseCode() == ResponseCode.RESPONSE_OK){
            return ((Fund)resultData.getData()).getName();
        }
        return "Fund Name Error";
    }
}
