package com.example.service;

import com.example.entity.Leads;
import com.example.entity.MeetingRecords;
import com.example.util.ResultData;

/**
 * Description:
 * Created by Floyd on 2019/2/1 16:46
 */
public interface LeadsService {

    ResultData addLeads(Leads leads);

    ResultData selectAllLeads();

    ResultData selectAllPipelines();

    ResultData selectAllWatchlist();

    ResultData selectAllPass();

    ResultData selectByUid(int uid);

    ResultData updateLeads(Leads leads);

    ResultData deleteByUid(int uid);

    ResultData fetchStatusField(int currentStatus);

    ResultData fetchConsultingStatus();

    ResultData selectMeetingRecords(int leadsId);

    ResultData addMeetingRecords(MeetingRecords meetingRecords);
}
