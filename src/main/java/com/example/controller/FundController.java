package com.example.controller;

import com.example.service.FundService;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Description:
 * Created by Floyd on 2019/4/24 11:45
 */
@RestController
@RequestMapping("api/fund")
public class FundController {

    @Autowired
    private FundService fundService;

    @GetMapping
    ResultData allFund(){
        return fundService.fetchAllFundBriefInfo();
    }
}
