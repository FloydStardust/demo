package com.example.dao.impl;

import com.example.dao.BaseDao;
import com.example.dao.FinancialTitleDao;
import com.example.entity.FinancialTitle;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/2/21 14:01
 */
@Repository
public class FinancialTitleDaoImpl extends BaseDao implements FinancialTitleDao  {
    @Override
    public ResultData select(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try{
            List<FinancialTitle> list = sqlSession.selectList("vkc.financial_title.select", condition);
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
            List<FinancialTitle> list = sqlSession.selectList("vkc.financial_title.selectByUid", uid);
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
    public ResultData selectByPortfolioIdAndSheetType(int portfolioId, int sheetType) {
        Map<String, Object> condition = new HashMap<>();
        condition.put("portfolioId", portfolioId);
        condition.put("belongTo", sheetType);
        return select(condition);
    }

    @Override
    public ResultData insert(FinancialTitle title) {
        ResultData result = new ResultData();
        try {
            sqlSession.insert("vkc.financial_title.insert", title);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }
}
