package com.example.dao;

import com.example.entity.FinancialTrack;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/2/21 16:48
 */
public interface FinancialTrackDao {

    ResultData selectManualTrack(Map<String, Object> condition);

    ResultData selectRawTrack(Map<String, Object> condition);

    ResultData selectByUid(int uid);

    ResultData insert(FinancialTrack track);
}
