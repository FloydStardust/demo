package com.example.service;

import com.example.entity.LP;
import com.example.entity.LPMeetingRecords;
import com.example.util.ResultData;

/**
 * Description: demo
 * Created by Floyd on 2019/4/29 16:41
 */
public interface LPService {
    ResultData getAll();

    ResultData addLP(LP lp);

    ResultData updateLP(LP lp);

    ResultData getMeetingRecords(int lpId);

    ResultData addMeetingRecord(LPMeetingRecords lpMeetingRecords);
}
