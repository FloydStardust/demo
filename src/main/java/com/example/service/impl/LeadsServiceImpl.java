package com.example.service.impl;

import com.example.dao.LeadsDao;
import com.example.dao.MeetingRecordsDao;
import com.example.entity.Leads;
import com.example.entity.MeetingRecords;
import com.example.service.LeadsService;
import com.example.util.CurrentUserHelper;
import com.example.util.LeadsUtils;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Description:
 * Created by Floyd on 2019/2/1 18:15
 */
@Service
public class LeadsServiceImpl implements LeadsService {

    @Autowired
    private LeadsDao leadsDao;
    @Autowired
    private MeetingRecordsDao meetingRecordsDao;

    @Override
    public ResultData addLeads(Leads leads) {
        return leadsDao.insert(leads);
    }

    @Override
    public ResultData selectAllLeads() {
        return leadsDao.selectAllLeads();
    }

    @Override
    public ResultData selectAllPipelines() {
        return leadsDao.selectAllPipelines();
    }

    @Override
    public ResultData selectAllWatchlist() {
        return leadsDao.selectAllWatchlist();
    }

    @Override
    public ResultData selectAllPass() {
        return leadsDao.selectAllPass();
    }

    @Override
    public ResultData selectByUid(int uid) {
        return leadsDao.selectByUid(uid);
    }

    @Override
    public ResultData updateLeads(Leads leads) {
        return leadsDao.update(leads);
    }

    @Override
    public ResultData deleteByUid(int uid) {
        return leadsDao.delete(uid);
    }

    @Override
    public ResultData fetchStatusField(int currentStatus) {
        Map<Integer, String> status = new HashMap<>();
        if(currentStatus == 0){
            status.putAll(EnumSet.allOf(LeadsUtils.LeadsStatus.class).stream().
                    collect(Collectors.toMap(LeadsUtils.LeadsStatus::getIndex, LeadsUtils.LeadsStatus::getName)));
        } else if(currentStatus == 1){
            status.putAll(EnumSet.allOf(LeadsUtils.PipelineStatus.class).stream().
                    collect(Collectors.toMap(LeadsUtils.PipelineStatus::getIndex, LeadsUtils.PipelineStatus::getName)));
        }else if(currentStatus == 2){
            status.putAll(EnumSet.allOf(LeadsUtils.WatchlistStatus.class).stream().
                    collect(Collectors.toMap(LeadsUtils.WatchlistStatus::getIndex, LeadsUtils.WatchlistStatus::getName)));
        } else if(currentStatus == 3){
            status.putAll(EnumSet.allOf(LeadsUtils.PassStatus.class).stream().
                    collect(Collectors.toMap(LeadsUtils.PassStatus::getIndex, LeadsUtils.PassStatus::getName)));
        } else {
            if(currentStatus <= LeadsUtils.LeadsStatus.TS.getIndex()){
                EnumSet<LeadsUtils.LeadsStatus> allStatus = EnumSet.allOf(LeadsUtils.LeadsStatus.class);
                for(LeadsUtils.LeadsStatus type : allStatus){
                    if(currentStatus <= type.getIndex()){
                        status.put(type.getIndex(), type.getName());
                    }
                }
                status.put(LeadsUtils.ParkStatus.PARK.getIndex(), LeadsUtils.ParkStatus.PARK.getName());
                status.put(LeadsUtils.PassStatus.PASS.getIndex(), LeadsUtils.PassStatus.PASS.getName());
            }else if(currentStatus <= LeadsUtils.PipelineStatus.PAYING.getIndex()){
                EnumSet<LeadsUtils.PipelineStatus> allStatus = EnumSet.allOf(LeadsUtils.PipelineStatus.class);
                for(LeadsUtils.PipelineStatus type : allStatus){
                    if(currentStatus <= type.getIndex()){
                        status.put(type.getIndex(), type.getName());
                    }
                }
                status.put(LeadsUtils.ParkStatus.PARK.getIndex(), LeadsUtils.ParkStatus.PARK.getName());
                status.put(LeadsUtils.PassStatus.PASS.getIndex(), LeadsUtils.PassStatus.PASS.getName());
            }else if(currentStatus <= LeadsUtils.WatchlistStatus.QUARTERLY.getIndex()){
                EnumSet<LeadsUtils.WatchlistStatus> allStatus = EnumSet.allOf(LeadsUtils.WatchlistStatus.class);
                for(LeadsUtils.WatchlistStatus type : allStatus){
                    if(currentStatus <= type.getIndex()){
                        status.put(type.getIndex(), type.getName());
                    }
                }
                status.put(LeadsUtils.ReturnLeads.RETURN.getIndex(), LeadsUtils.ReturnLeads.RETURN.getName());
                status.put(LeadsUtils.PassStatus.PASS.getIndex(), LeadsUtils.PassStatus.PASS.getName());
            }
        }
        ResultData resultData = new ResultData();
        resultData.setResponseCode(ResponseCode.RESPONSE_OK);
        resultData.setData(status);
        return resultData;
    }

    @Override
    public ResultData fetchConsultingStatus() {
        ResultData resultData = new ResultData();
        Map<Integer, String> status = new HashMap<>();
        status.putAll(EnumSet.allOf(LeadsUtils.ConsultingStatus.class).stream().
                collect(Collectors.toMap(LeadsUtils.ConsultingStatus::getIndex, LeadsUtils.ConsultingStatus::getName)));
        resultData.setData(status);
        resultData.setResponseCode(ResponseCode.RESPONSE_OK);
        return resultData;
    }

    @Override
    public ResultData selectMeetingRecords(int leadsId) {
        Map<String, Object> condition = new HashMap<>();
        condition.put("leadsId", leadsId);
        return meetingRecordsDao.select(condition);
    }

    @Override
    public ResultData addMeetingRecords(MeetingRecords meetingRecords) {
        return meetingRecordsDao.insert(meetingRecords);
    }

}
