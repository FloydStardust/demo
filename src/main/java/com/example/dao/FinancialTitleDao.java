package com.example.dao;

import com.example.entity.FinancialTitle;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/2/21 13:55
 */
public interface FinancialTitleDao {
    ResultData select(Map<String, Object> condition);

    ResultData selectByUid(int uid);

    ResultData selectByPortfolioIdAndSheetType(int portfolioId, int sheetType);

    ResultData insert(FinancialTitle title);
}
