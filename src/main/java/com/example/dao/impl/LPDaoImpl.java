package com.example.dao.impl;

import com.example.dao.BaseDao;
import com.example.dao.LPDao;
import com.example.entity.LP;
import com.example.entity.Vendor;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Description: demo
 * Created by Floyd on 2019/4/29 14:54
 */
@Repository
public class LPDaoImpl extends BaseDao implements LPDao {
    @Override
    public ResultData select(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try {
            List<Vendor> list = sqlSession.selectList("vkc.lp.select", condition);
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
    public ResultData insert(LP lp) {
        ResultData result = new ResultData();
        try {
            sqlSession.insert("vkc.lp.insert", lp);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData update(LP lp) {
        ResultData result = new ResultData();
        try {
            sqlSession.update("vkc.lp.update", lp);
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
            sqlSession.delete("vkc.lp.delete", uid);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }
}
