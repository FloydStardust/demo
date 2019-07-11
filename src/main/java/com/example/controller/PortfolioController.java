package com.example.controller;

import com.example.entity.Portfolio;
import com.example.service.FundService;
import com.example.service.PortfolioService;
import com.example.util.CurrentUserHelper;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Description: REST controller for data fetch
 * Created by Floyd on 2019/2/10 16:53
 */
@RestController
@RequestMapping("api/portfolio")
public class PortfolioController {

    @Autowired
    private PortfolioService portfolioService;
    @Autowired
    private FundService fundService;
    @Autowired
    private CurrentUserHelper currentUserHelper;

    @GetMapping("/auth")
    public ResultData getAuth(){
        ResultData resultData = new ResultData();
        List<Integer> authes = new ArrayList<Integer>(){{
            add(4);
            add(5);
            add(6);
            add(7);
            add(8);
            add(17);
            add(28);
        }};
        int currentUser = currentUserHelper.currentUser().getId();
        if(authes.contains(currentUser)) {
            resultData.setResponseCode(ResponseCode.RESPONSE_OK);
        }else {
            resultData.setResponseCode(ResponseCode.RESPONSE_ERROR);
        }
        return resultData;
    }

    @GetMapping("/fund")
    public ResultData getAllFund(){
        return fundService.fetchAllFund();
    }

    @GetMapping
    public ResultData showAll(){
        return portfolioService.fetchAllPortfolio();
    }

    @GetMapping("/{uid}")
    public ResultData getOne(@PathVariable int uid){
        return portfolioService.getPortfolio(uid);
    }
    @PostMapping
    public ResultData create(@RequestBody Portfolio portfolio){
        ResultData result = new ResultData();
        if (Objects.isNull(portfolio.getName()) || Objects.isNull(portfolio.getFundId()) ||
                Objects.isNull(portfolio.getInvestNum())){
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription("必要字段 [项目名称、基金名称、投资金额] 不能为空！");
        } else{
            result = portfolioService.addPortfolio(portfolio);
        }
        return result;
    }

    @GetMapping("/profit/{id}")
    public ResultData profit(@PathVariable int id){
        ResultData result = portfolioService.getProfit(id);
        return result;
    }

    @GetMapping("/balance/{id}")
    public ResultData balance(@PathVariable int id){
        ResultData result = portfolioService.getBalance(id);
        return result;
    }

    @GetMapping("/profit_summary/{id}")
    public ResultData profitSummary(@PathVariable int id){
        ResultData result = portfolioService.getProfitSummary(id);
        return result;
    }

    @GetMapping("/balance_summary/{id}")
    public ResultData balanceSummary(@PathVariable int id){
        ResultData result = portfolioService.getBalanceSummary(id);
        return result;
    }

}
