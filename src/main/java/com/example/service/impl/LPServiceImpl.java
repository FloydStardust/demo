package com.example.service.impl;

import com.example.dao.LPDao;
import com.example.dao.LPMeetingRecordsDao;
import com.example.entity.LP;
import com.example.entity.LPMeetingRecords;
import com.example.service.LPService;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import com.example.vo.LPVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/4/29 16:44
 */
@Service
public class LPServiceImpl implements LPService {

    @Autowired
    private LPDao lpDao;
    @Autowired
    private LPMeetingRecordsDao lpMeetingRecordsDao;

    @Override
    public ResultData getAll() {
        ResultData resultData = new ResultData();
        Map<String, Object> condition = new HashMap<>();
        Map<String, Object> meetingCondition = new HashMap<>();
        ResultData daoResult = lpDao.select(condition);
        List<LPVo> list = new ArrayList<>();
        if(daoResult.getResponseCode()== ResponseCode.RESPONSE_OK){
            for(LP lp : (List<LP>)daoResult.getData()){
                LPVo vo = new LPVo(lp);
                meetingCondition.put("lpId", lp.getUid());
                ResultData lpMeetingRecords = lpMeetingRecordsDao.select(meetingCondition);
                if(lpMeetingRecords.getResponseCode()==ResponseCode.RESPONSE_OK){
                    LPMeetingRecords lastMeeting = ((List<LPMeetingRecords>)lpMeetingRecords.getData()).get(0);
                    vo.setLastMeetDate(lastMeeting.getDate());
                    vo.setLastMeetUser(lastMeeting.getUser());
                }
                list.add(vo);
            }
            resultData.setResponseCode(ResponseCode.RESPONSE_OK);
            resultData.setData(list);
        }else {
            resultData.setResponseCode(daoResult.getResponseCode());
        }
        return resultData;
    }

    @Override
    public ResultData addLP(LP lp) {
        return lpDao.insert(lp);
    }

    @Override
    public ResultData updateLP(LP lp) {
        return lpDao.update(lp);
    }

    @Override
    public ResultData getMeetingRecords(int lpId) {
        Map<String, Object> meetingCondition = new HashMap<>();
        meetingCondition.put("lpId", lpId);
        ResultData lpMeetingRecords = lpMeetingRecordsDao.select(meetingCondition);
        return lpMeetingRecords;
    }

    @Override
    public ResultData addMeetingRecord(LPMeetingRecords lpMeetingRecords) {
        return lpMeetingRecordsDao.insert(lpMeetingRecords);
    }
}
