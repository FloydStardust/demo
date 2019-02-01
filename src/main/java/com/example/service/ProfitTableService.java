package com.example.service;


import com.example.util.ResultData;

/**
 * Description: profit table BI processing
 * Created by Floyd on 2019/1/29 20:44
 */
public interface ProfitTableService {
    /**
     * 权限检查
     * @param projectId
     * @return List<ProfitTableRow>
     */
    ResultData getProfitTable(int projectId);

    /**
     * 权限检查
     * @param projectId
     * @return List<ProfitTableRow>
     */
    ResultData getProfitHistoryData(int projectId);

}
