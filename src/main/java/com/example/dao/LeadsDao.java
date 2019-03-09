package com.example.dao;

import com.example.entity.Leads;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/2/1 15:16
 */
public interface LeadsDao {
    ResultData select(Map<String, Object> condition);

    ResultData selectAllLeads();

    ResultData selectAllPipelines();

    ResultData selectAllWatchlist();

    ResultData selectAllPass();

    ResultData selectByUid(int uid);

    ResultData insert(Leads leads);

    ResultData update(Leads leads);

    ResultData delete(int uid);
}
