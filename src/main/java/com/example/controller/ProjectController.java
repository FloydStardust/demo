package com.example.controller;

import com.alibaba.fastjson.JSON;
import com.example.entity.Portfolio;
import com.example.entity.ProfitTable;
import com.example.repository.PortfolioRepository;
import com.example.service.ProfitTableService;
import com.example.util.ResultData;
import com.example.vo.ProfitTableRow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.*;

/**
 * Description: demo
 * Created by VKC on 2019/1/29 17:37
 */
@RestController
@RequestMapping("api/portfolio")
public class ProjectController {

    @Autowired
    ProfitTableService profitTableService;
    @Autowired
    PortfolioRepository portfolioRepository;

    @GetMapping("")
    public String getAll(){
        Set<Portfolio> allPortfolios = (Set<Portfolio>) portfolioRepository.findAll();
        return JSON.toJSONString(allPortfolios);
    }


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
