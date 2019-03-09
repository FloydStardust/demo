package com.example.controller;

import com.example.entity.Leads;
import com.example.service.LeadsService;
import com.example.util.CurrentUserHelper;
import com.example.util.ResultData;
import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

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

    @GetMapping("/pass")
    public ResultData allPass(){
        return leadsService.selectAllPass();
    }

    @PostMapping
    public ResultData create(@RequestBody Leads leads){
        if(leads.getUid()==0){
            return leadsService.addLeads(leads);
        } else {
            leads.setLastChange(new Date());
            return leadsService.updateLeads(leads);
        }

    }

    @PutMapping
    public ResultData update(@RequestBody Leads leads){
        return leadsService.updateLeads(leads);
    }

    @GetMapping("/status/{current}")
    public ResultData getNextStatus(@PathVariable int current){
        return leadsService.fetchStatusField(current);
    }
}
