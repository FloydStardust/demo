package com.example.controller;

import com.example.entity.LP;
import com.example.entity.LPMeetingRecords;
import com.example.service.LPService;
import com.example.util.CurrentUserHelper;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 * Created by Floyd on 2019/4/29 15:24
 */
@RestController
@RequestMapping("api/lp")
public class LPController {

    @Autowired
    private LPService lpService;
    @Autowired
    private CurrentUserHelper currentUserHelper;

    @GetMapping("/auth")
    public ResultData getAuth(){
        ResultData resultData = new ResultData();
        List<Integer> authes = new ArrayList<Integer>(){{
            add(4);
            add(5);
            add(7);
            add(17);
            add(28);
            add(30);
        }};
        int currentUser = currentUserHelper.currentUser().getId();
        if(authes.contains(currentUser)) {
            resultData.setResponseCode(ResponseCode.RESPONSE_OK);
        }else {
            resultData.setResponseCode(ResponseCode.RESPONSE_ERROR);
        }
        return resultData;
    }

    @GetMapping
    public ResultData getLp(){
        return lpService.getAll();
    }

    @PostMapping
    public ResultData addLp(@RequestBody LP lp){
        if(lp.getUid()==0)
            return lpService.addLP(lp);
        else
            return lpService.updateLP(lp);
    }

    @GetMapping("/records/{id}")
    public ResultData getLpMeetingRecords(@PathVariable int id){
        return lpService.getMeetingRecords(id);
    }

    @PostMapping("/records")
    public ResultData addLpMeetingRecord(@RequestBody LPMeetingRecords lpMeetingRecords){
        return lpService.addMeetingRecord(lpMeetingRecords);
    }

}
