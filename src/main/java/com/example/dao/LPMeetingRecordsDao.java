package com.example.dao;

import com.example.entity.LPMeetingRecords;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description: demo
 * Created by Floyd on 2019/4/29 14:46
 */
public interface LPMeetingRecordsDao {

    ResultData select(Map<String, Object> condition);

    ResultData insert(LPMeetingRecords lpMeetingRecords);

    ResultData update(LPMeetingRecords lpMeetingRecords);

    ResultData delete(int uid);

}
