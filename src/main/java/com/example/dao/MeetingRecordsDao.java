package com.example.dao;

import com.example.entity.Leads;
import com.example.entity.MeetingRecords;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/3/26 10:45
 */
public interface MeetingRecordsDao {

    ResultData select(Map<String, Object> condition);

    ResultData insert(MeetingRecords meetingRecords);

    ResultData delete(int uid);
}
