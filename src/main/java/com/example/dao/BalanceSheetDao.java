package com.example.dao;

import com.example.entity.BalanceSheet;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description: demo
 * Created by Floyd on 2019/2/14 18:09
 */
public interface BalanceSheetDao {
    ResultData select(Map<String, Object> condition);

    ResultData selectByUid(int uid);

    ResultData insert(BalanceSheet balanceSheet);
}
