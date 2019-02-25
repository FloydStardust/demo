package com.example.dao.impl;

import com.example.dao.BaseDao;
import com.example.dao.FinancialTrackDao;
import com.example.entity.FinancialTrack;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/2/21 16:51
 */
@Repository
public class FinancialTrackDaoImpl extends BaseDao implements FinancialTrackDao {

    @Override
    public ResultData selectManualTrack(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try{
            List<FinancialTrack> list = sqlSession.selectList("vkc.financial_track.selectManualTrack", condition);
            if (list.isEmpty()){
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
    public ResultData selectRawTrack(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try{
            List<FinancialTrack> list = sqlSession.selectList("vkc.financial_track.selectRawTrack", condition);
            if (list.isEmpty()){
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
            List<FinancialTrack> list = sqlSession.selectList("vkc.financial_track.selectByUid", uid);
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
    public ResultData insert(FinancialTrack track) {
        ResultData result = new ResultData();
        try {
            sqlSession.insert("vkc.financial_track.insert", track);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }
}
