package com.example.dao.impl;

import com.example.dao.BaseDao;
import com.example.dao.LeadsDao;
import com.example.entity.Leads;
import com.example.util.LeadsUtils;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description: Leads DAO
 * Created by Floyd on 2019/2/1 15:18
 */
@Repository
public class LeadsDaoImpl extends BaseDao implements LeadsDao {
    @Override
    public ResultData select(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try {
            List<Leads> list = sqlSession.selectList("vkc.leads.select", condition);
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
    public ResultData selectAllLeads() {
        Map<String, Object> condition = new HashMap<>();
        condition.put("statusLessAndEqual", LeadsUtils.LeadsStatus.TS.getIndex());
        condition.put("statusBiggerAndEqual", LeadsUtils.LeadsStatus.BP.getIndex());
        return select(condition);
    }

    @Override
    public ResultData selectAllPipelines() {
        Map<String, Object> condition = new HashMap<>();
        condition.put("statusLessAndEqual", LeadsUtils.PipelineStatus.PAYING.getIndex());
        condition.put("statusBiggerAndEqual", LeadsUtils.PipelineStatus.DD.getIndex());
        return select(condition);
    }

    @Override
    public ResultData selectAllWatchlist() {
        Map<String, Object> condition = new HashMap<>();
        condition.put("statusLessAndEqual", LeadsUtils.WatchlistStatus.QUARTERLY.getIndex());
        condition.put("statusBiggerAndEqual", LeadsUtils.WatchlistStatus.NOT_TRACK.getIndex());
        return select(condition);
    }

    @Override
    public ResultData selectAllPass() {
        Map<String, Object> condition = new HashMap<>();
        condition.put("status", LeadsUtils.PassStatus.PASS.getIndex());
        return select(condition);
    }

    @Override
    public ResultData selectByUid(int uid) {
        ResultData result = new ResultData();
        try {
            List<Leads> list = sqlSession.selectList("vkc.leads.selectByUid", uid);
            if (list.isEmpty()) {
                result.setResponseCode(ResponseCode.RESPONSE_NULL);
            } else {
                result.setData(list.get(0));
            }
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData insert(Leads leads) {
        ResultData result = new ResultData();
        try {
            sqlSession.insert("vkc.leads.insert", leads);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData update(Leads leads) {
        ResultData result = new ResultData();
        try {
            sqlSession.update("vkc.leads.update", leads);
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
            sqlSession.delete("vkc.leads.delete", uid);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }
}
