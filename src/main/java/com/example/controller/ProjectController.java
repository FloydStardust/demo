package com.example.controller;

import com.alibaba.fastjson.JSON;
import com.example.service.ProfitTableService;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Description: demo
 * Created by Floyd on 2019/1/29 17:37
 */
@RestController
@RequestMapping("api/portfolio")
public class ProjectController {

    @Autowired
    ProfitTableService profitTableService;
//    @Autowired
//    PortfolioRepository portfolioRepository;

//    @GetMapping("")
//    public String getAll(){
//        Set<Portfolio> allPortfolios = (Set<Portfolio>) portfolioRepository.findAll();
//        return JSON.toJSONString(allPortfolios);
//    }


    @GetMapping("/{projectId}")
    public String getProfitTable(@PathVariable int projectId){
        ResultData resultData = profitTableService.getProfitTable(projectId);
        String response = JSON.toJSONString(resultData);
        return response;
    }

    @GetMapping("/history/{projectId}")
    public String getExtraProfitData(@PathVariable int projectId){
        return null;
    }

}
