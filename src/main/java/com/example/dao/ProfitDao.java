package com.example.dao;

import com.example.entity.Profit;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description: demo
 * Created by Floyd on 2019/2/14 18:08
 */
public interface ProfitDao {
    ResultData select(Map<String, Object> condition);

    ResultData selectByUid(int uid);

    ResultData insert(Profit profit);
}
