package com.example.dao.impl;

import com.example.dao.AuthorizationDao;
import com.example.dao.BaseDao;
import com.example.entity.Authorization;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/4/4 12:51
 */
@Repository
public class AuthorizationDaoImpl extends BaseDao implements AuthorizationDao {
    @Override
    public ResultData select(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try{
            List<Authorization> list = sqlSession.selectList("vkc.myauth.select", condition);
            if (list.isEmpty()) {
                result.setResponseCode(ResponseCode.RESPONSE_NULL);
            } else {
                result.setResponseCode(ResponseCode.RESPONSE_OK);
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
            List<Authorization> list = sqlSession.selectList("vkc.myauth.selectByUid", uid);
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
    public ResultData insert(Authorization authorization) {
        ResultData result = new ResultData();
        try {
            sqlSession.insert("vkc.myauth.insert", authorization);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData update(Authorization authorization) {
        ResultData result = new ResultData();
        try {
            sqlSession.update("vkc.myauth.update", authorization);
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
            sqlSession.delete("vkc.myauth.delete", uid);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }
}
