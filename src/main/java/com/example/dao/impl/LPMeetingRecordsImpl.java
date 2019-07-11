package com.example.dao.impl;

import com.example.dao.BaseDao;
import com.example.dao.LPMeetingRecordsDao;
import com.example.entity.LPMeetingRecords;
import com.example.entity.Vendor;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Description: demo
 * Created by VKC on 2019/4/29 15:00
 */
@Repository
public class LPMeetingRecordsImpl extends BaseDao implements LPMeetingRecordsDao {
    @Override
    public ResultData select(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try {
            List<Vendor> list = sqlSession.selectList("vkc.lpMeetingRecords.select", condition);
            if (list.isEmpty()) {
                result.setResponseCode(ResponseCode.RESPONSE_NULL);
            } else {
                result.setData(list);
            }
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData insert(LPMeetingRecords lpMeetingRecords) {
        ResultData result = new ResultData();
        try {
            sqlSession.insert("vkc.lpMeetingRecords.insert", lpMeetingRecords);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData update(LPMeetingRecords lpMeetingRecords) {
        ResultData result = new ResultData();
        try {
            sqlSession.update("vkc.lpMeetingRecords.update", lpMeetingRecords);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData delete(int uid) {
        ResultData result = new ResultData();
        try {
            sqlSession.delete("vkc.lpMeetingRecords.delete", uid);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }
}
