package com.example.service.impl;

import com.example.service.ProfitTableService;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import com.example.vo.ProfitTableRow;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;

/**
 * Description: implemention of profit tabel data processing
 * Created by VKC on 2019/1/29 20:51
 */
@Service
public class ProfitTableServiceImpl implements ProfitTableService {

    private final List<String> left_header = new ArrayList<>(Arrays.asList("营业收入","营业成本","毛利","营业税金及附加",
            "销售费用","管理费用","财务费用","资产减值损失","公允价值变动","投资收益","其他收益","营业利润","营业外收入",
            "营业外支出","利润总额","所得税费用","净利润","毛利率","销售费用率","管理费用率","财务费用率","营业利润率",
            "利润率","净利率"));

    // 目前YTD这里是写死的，如：19YTD。今后需修改，动态生成年份
    private final List<String> top_header = new ArrayList<>(Arrays.asList("current","last","MoM","YoY",
            "19YTD","18YTD","YoY","FY19-E","完成%"
//            ,"本季数","上季数","同期数","QoQ","YoY"
    ));

    @Override
    public ResultData getProfitTable(int projectId) {
        ResultData resultData = new ResultData();
        List<Object> profitTable = new ArrayList<>();
        for(String item: left_header){
            ProfitTableRow row = new ProfitTableRow(item);
            Map<String, Object> tableRow = new HashMap<>();
            LocalDate today = LocalDate.now();
            String date = today.getYear()+"-"+today.getMonthValue();
            row.addNumbers(date,1000, 200, 0.3342, 0.8933, 1100,
                    900,0.7902,3000,0.2300);

            profitTable.add(row);
        }
        resultData.setData(profitTable);
        resultData.setResponseCode(ResponseCode.RESPONSE_OK);
        resultData.setDescription("desciption");
        return resultData;
    }

}
