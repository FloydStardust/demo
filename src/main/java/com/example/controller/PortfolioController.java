package com.example.controller;

import com.example.entity.Portfolio;
import com.example.service.FundService;
import com.example.service.PortfolioService;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/fund")
    public ResultData getAllFund(){
        return fundService.fetchAllFund();
    }

    @GetMapping
    public ResultData showAll(){
        return portfolioService.fetchAllPortfolio();
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

        return null;
    }

    @GetMapping("/balance/{id}")
    public ResultData balance(@PathVariable int id){
        return null;
    }

}
