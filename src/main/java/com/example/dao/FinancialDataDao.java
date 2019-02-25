package com.example.dao;

import com.example.entity.FinancialData;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/2/21 15:22
 */
public interface FinancialDataDao {
    ResultData select(Map<String, Object> condition);

    ResultData selectByUid(int uid);

    ResultData selectByTitleAndTrackId(int titleId, int trackId);

    ResultData insert(FinancialData data);
}
