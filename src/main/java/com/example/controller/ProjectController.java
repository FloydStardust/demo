package com.example.controller;

import com.alibaba.fastjson.JSON;
import com.example.entity.ProfitTable;
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
@RequestMapping("api/project_detail")
public class ProjectController {

    @Autowired
    ProfitTableService profitTableService;


    @GetMapping("/{projectId}")
    public String getProfitTable(@PathVariable int projectId){
        ResultData resultData = profitTableService.getProfitTable(projectId);
        String response = JSON.toJSONString(resultData);
        return response;
    }

    public String getExtraProfitData(@PathVariable int projectId){
        return null;
    }

}
