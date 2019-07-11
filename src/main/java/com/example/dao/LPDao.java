package com.example.dao;

import com.example.entity.LP;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/4/29 14:27
 */
public interface LPDao {

    ResultData select(Map<String, Object> condition);

    ResultData insert(LP lp);

    ResultData update(LP lp);

    ResultData delete(int uid);

}
