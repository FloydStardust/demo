package com.example.dao.impl;

import com.example.dao.BaseDao;
import com.example.dao.MeetingRecordsDao;
import com.example.entity.MeetingRecords;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/3/26 10:47
 */
@Repository
public class MeetingRecordsDaoImpl  extends BaseDao implements MeetingRecordsDao {
    @Override
    public ResultData select(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try {
            List<MeetingRecords> list = sqlSession.selectList("vkc.meeting_records.select", condition);
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
    public ResultData insert(MeetingRecords meetingRecords) {
        ResultData result = new ResultData();
        try {
            sqlSession.insert("vkc.meeting_records.insert", meetingRecords);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData delete(int uid) {
        ResultData result = new ResultData();
        try {
            sqlSession.delete("vkc.meeting_records.delete", uid);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }
}
