package com.example.dao.impl;

import com.example.dao.BaseDao;
import com.example.dao.VendorDao;
import com.example.entity.Vendor;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/4/24 10:46
 */
@Repository
public class VendorDaoImpl extends BaseDao implements VendorDao {
    @Override
    public ResultData select(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try {
            List<Vendor> list = sqlSession.selectList("vkc.vendor.select", condition);
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
    public ResultData update(Vendor vendor) {
        ResultData result = new ResultData();
        try {
            sqlSession.update("vkc.vendor.update", vendor);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData insert(Vendor vendor) {
        ResultData result = new ResultData();
        try {
            sqlSession.insert("vkc.vendor.insert", vendor);
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
            sqlSession.delete("vkc.vendor.delete", uid);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }
}
