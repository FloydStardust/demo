package com.example.dao.impl;

import com.example.dao.BaseDao;
import com.example.dao.FinancialDataDao;
import com.example.entity.FinancialData;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/2/21 15:25
 */
@Repository
public class FinancialDataDaoImpl extends BaseDao implements FinancialDataDao{
    @Override
    public ResultData select(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try{
            List<FinancialData> list = sqlSession.selectList("vkc.financial_data.select", condition);
            if (list.isEmpty()) {
                result.setResponseCode(ResponseCode.RESPONSE_NULL);
            } else {
                result.setData(list);
            }
        } catch (Exception e){
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData selectByUid(int uid) {
        ResultData result = new ResultData();
        try{
            List<FinancialData> list = sqlSession.selectList("vkc.financial_data.selectByUid", uid);
            if (list.isEmpty()){
                result.setResponseCode(ResponseCode.RESPONSE_NULL);
            } else {
                result.setData(list.get(0));
            }
        } catch (Exception e){
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData selectByTitleAndTrackId(int titleId, int trackId) {
        Map<String, Object> condition = new HashMap<>();
        condition.put("titleId", titleId);
        condition.put("trackId", trackId);
        return select(condition);
    }

    @Override
    public ResultData insert(FinancialData data) {
        ResultData result = new ResultData();
        try {
            sqlSession.insert("vkc.financial_data.insert", data);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }
}
