package com.example.controller;

import com.example.entity.Leads;
import com.example.entity.MeetingRecords;
import com.example.service.LeadsService;
import com.example.util.CurrentUserHelper;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

    @GetMapping("/auth")
    public ResultData getAuth(){
        ResultData resultData = new ResultData();
        List<Integer> nonAuthes = new ArrayList<Integer>(){{
            add(25);

        }};
        int currentUser = currentUserHelper.currentUser().getId();
        if(nonAuthes.contains(currentUser)) {
            resultData.setResponseCode(ResponseCode.RESPONSE_ERROR);
        }else {
            resultData.setResponseCode(ResponseCode.RESPONSE_OK);
        }
        return resultData;
    }

    @GetMapping
    public ResultData allLeads(){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        System.out.println(df.format(new Date()) + ": "+currentUserHelper.currentUser().getUserName() + " has been logged");
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
        leads.setLastChange(new Date());
        if(leads.getUid()==0){
            return leadsService.addLeads(leads);
        } else {
            return leadsService.updateLeads(leads);
        }

    }

    @PutMapping
    public ResultData update(@RequestBody Leads leads){
        return leadsService.updateLeads(leads);
    }

    @GetMapping("/consulting")
    public ResultData getConsultingStatus(){
        return leadsService.fetchConsultingStatus();
    }

    @GetMapping("/status/{current}")
    public ResultData getNextStatus(@PathVariable int current){
        return leadsService.fetchStatusField(current);
    }

    @GetMapping("/records/{id}")
    public ResultData getMeetingRecord(@PathVariable int id){
        return leadsService.selectMeetingRecords(id);
    }

    @PostMapping("/records/{id}")
    public ResultData addMeetingRecord(@RequestBody MeetingRecords meetingRecords){
        meetingRecords.setUser(currentUserHelper.currentUser().getUserName());
        return leadsService.addMeetingRecords(meetingRecords);
    }
}
