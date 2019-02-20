package com.example.dao.impl;

import com.example.dao.BaseDao;
import com.example.dao.ProfitDao;
import com.example.entity.Profit;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Description: demo
 * Created by Floyd on 2019/2/14 18:12
 */
@Repository
public class ProfitDaoImpl extends BaseDao implements ProfitDao {
    @Override
    public ResultData select(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try{
            List<Profit> list = sqlSession.selectList("vkc.profit.select", condition);
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
            List<Profit> list = sqlSession.selectList("vkc.profit.selectByUid", uid);
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
    public ResultData insert(Profit profit) {
        ResultData result = new ResultData();
        try {
            sqlSession.insert("vkc.profit.insert", profit);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }
}
