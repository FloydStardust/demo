package com.example.dao;

import com.example.entity.Portfolio;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description: demo
 * Created by VKC on 2019/1/30 21:19
 */
public interface PortfolioDao {
    ResultData select(Map<String, Object> condition);

    ResultData selectByUid(int uid);

    ResultData insert(Portfolio portfolio);

    ResultData update(Portfolio portfolio);

    ResultData delete(int uid);
}
