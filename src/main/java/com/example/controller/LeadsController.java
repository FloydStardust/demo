package com.example.controller;

import com.example.entity.Leads;
import com.example.service.LeadsService;
import com.example.util.CurrentUserHelper;
import com.example.util.ResultData;
import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Description: demo
 * Created by Floyd on 2019/2/25 15:30
 */
@RestController
@RequestMapping("api/leads")
public class LeadsController {

    @Autowired
    private LeadsService leadsService;

    @Autowired
    private CurrentUserHelper currentUserHelper;

    @GetMapping
    public ResultData allLeads(){
        return leadsService.selectAllLeads();
    }

    @GetMapping("/pipeline")
    public ResultData allPipeline(){
        return leadsService.selectAllPipelines();
    }

    @GetMapping("/watchlist")
    public ResultData allWatchlist(){
        return leadsService.selectAllWatchlist();
    }

    @PostMapping
    public ResultData create(@RequestBody Leads leads){
        return leadsService.addLeads(leads);
    }

    @PutMapping
    public ResultData update(@RequestBody Leads leads){
        return leadsService.updateLeads(leads);
    }

    @GetMapping("/status")
    public ResultData getAllStatus(){
        return leadsService.fetchStatusField();
    }
}
