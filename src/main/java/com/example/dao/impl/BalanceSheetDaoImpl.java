package com.example.dao.impl;

import com.example.dao.BalanceSheetDao;
import com.example.dao.BaseDao;
import com.example.entity.BalanceSheet;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Description: demo
 * Created by Floyd on 2019/2/14 18:13
 */
@Repository
public class BalanceSheetDaoImpl extends BaseDao implements BalanceSheetDao {
    @Override
    public ResultData select(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try{
            List<BalanceSheet> list = sqlSession.selectList("vkc.balance.select", condition);
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
            List<BalanceSheet> list = sqlSession.selectList("vkc.balance.selectByUid", uid);
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
    public ResultData insert(BalanceSheet balanceSheet) {
        ResultData result = new ResultData();
        try {
            sqlSession.insert("vkc.balance.insert", balanceSheet);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }
}
