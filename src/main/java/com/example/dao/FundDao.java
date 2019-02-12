package com.example.dao;

import com.example.entity.Fund;
import com.example.entity.Leads;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description: data access object of Fund
 * Created by Floyd on 2019/2/10 16:25
 */
public interface FundDao {

    ResultData select(Map<String, Object> condition);

    ResultData selectByUid(int uid);

    ResultData insert(Fund fund);
}
