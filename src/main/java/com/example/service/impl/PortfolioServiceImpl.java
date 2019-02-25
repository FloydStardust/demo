package com.example.service.impl;

import com.example.dao.*;
import com.example.entity.*;
import com.example.service.PortfolioService;
import com.example.util.PortfolioUtils;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import com.example.vo.AddPortfolioFieldsVo;
import com.example.vo.FinancialStatementVo;
import com.example.vo.PortfolioVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.NumberFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Description: demo
 * Created by Floyd on 2019/2/10 16:36
 */
@Service
public class PortfolioServiceImpl implements PortfolioService {

    @Autowired
    private FundDao fundDao;
    @Autowired
    private PortfolioDao portfolioDao;
    @Autowired
    private FinancialTitleDao financialTitleDao;
    @Autowired
    private FinancialDataDao financialDataDao;
    @Autowired
    private FinancialTrackDao financialTrackDao;
    @Override
    public ResultData addPortfolio(Portfolio portfolio) {
        return portfolioDao.insert(portfolio);
    }

    @Override
    public ResultData deletePortfolio(int uid) {
        return portfolioDao.delete(uid);
    }

    @Override
    public ResultData updatePortfolio(Portfolio portfolio) {
        return null;
    }

    @Override
    public ResultData getPortfolio(int uid) {
        return portfolioDao.selectByUid(uid);
    }

    @Override
    public ResultData fetchAllPortfolio() {
        ResultData result = new ResultData();
        Map<String, Object> condition = new HashMap<>();
        ResultData resultData = portfolioDao.select(condition);
        if(resultData.getResponseCode() == ResponseCode.RESPONSE_OK){
            List<PortfolioVo> portfolioVos = new ArrayList<>();
            for(Portfolio item: (List<Portfolio>)resultData.getData()){
                PortfolioVo portfolioVo = new PortfolioVo(item);
                portfolioVo.setFundName(getFundNameById(item.getFundId()));
                portfolioVos.add(portfolioVo);
            }
            result.setResponseCode(ResponseCode.RESPONSE_OK);
            result.setData(portfolioVos);
        } else {
            System.out.println(resultData.getDescription());
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription("Dao Layer Error...");
        }
        return result;
    }

    @Override
    public ResultData getAddPortfolioFields() {
        ResultData result = new ResultData();
        Map<String, Object> condition = new HashMap<>();
        ResultData allFunds = fundDao.select(condition);

        if(allFunds.getResponseCode() == ResponseCode.RESPONSE_OK){
            AddPortfolioFieldsVo addPortfolioFieldsVo = new AddPortfolioFieldsVo();
            List<Fund> list = (List<Fund>) allFunds.getData();
            Map<Integer, String> briefInfo = list.stream().collect(Collectors.toMap(Fund::getUid, Fund::getName));

            addPortfolioFieldsVo.setFunds(briefInfo);
            addPortfolioFieldsVo.setIPOStatus(PortfolioUtils.IPO_STATUS.toMap());
            addPortfolioFieldsVo.setInvestType( EnumSet.allOf(PortfolioUtils.InvestType.class).stream().
                    collect(Collectors.toMap(PortfolioUtils.InvestType::getIndex, PortfolioUtils.InvestType::getName)));
            addPortfolioFieldsVo.setShareType( EnumSet.allOf(PortfolioUtils.ShareType.class).stream().
                    collect(Collectors.toMap(PortfolioUtils.ShareType::getIndex, PortfolioUtils.ShareType::getName)));
            addPortfolioFieldsVo.setExitStatus( EnumSet.allOf(PortfolioUtils.ExitStatus.class).stream().
                    collect(Collectors.toMap(PortfolioUtils.ExitStatus::getIndex, PortfolioUtils.ExitStatus::getName)));
            addPortfolioFieldsVo.setMoneyType( EnumSet.allOf(PortfolioUtils.MoneyType.class).stream().
                    collect(Collectors.toMap(PortfolioUtils.MoneyType::getIndex, PortfolioUtils.MoneyType::getName)));
            addPortfolioFieldsVo.setExitType( EnumSet.allOf(PortfolioUtils.ExitTye.class).stream().
                    collect(Collectors.toMap(PortfolioUtils.ExitTye::getIndex, PortfolioUtils.ExitTye::getName)));

            result.setData(addPortfolioFieldsVo);
            result.setResponseCode(ResponseCode.RESPONSE_OK);
        } else {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
        }
        return result;
    }

    @Override
    public ResultData getProfit(int uid) {
        return getData(uid, PortfolioUtils.FinancialStatementType.PROFIT_LOSS);
    }

    @Override
    public ResultData getBalance(int uid) {
        return getData(uid, PortfolioUtils.FinancialStatementType.BALANCE_SHEET);
    }

    @Override
    public ResultData getProfitSummary(int uid) {
        return getSummary(uid, PortfolioUtils.FinancialStatementType.PROFIT_LOSS);
    }

    @Override
    public ResultData getBalanceSummary(int uid) {
        return getSummary(uid, PortfolioUtils.FinancialStatementType.BALANCE_SHEET);
    }

    private ResultData getSummary(int uid, int sheetType){
        ResultData resultData = new ResultData();
        List<FinancialStatementVo> data = new ArrayList<>();

        // select summary titles
        Map<String, Object> condition = new HashMap<>();
        condition.put("portfolioId", uid);
        condition.put("belongTo", sheetType);
        condition.put("importance", PortfolioUtils.FinancialTitleImportance.SUMMARY);
        ResultData titleResult = financialTitleDao.select(condition);
        if(titleResult.getResponseCode() ==  ResponseCode.RESPONSE_OK){
            // add the first column: financial titles
            List<FinancialTitle> titles = (List<FinancialTitle>) titleResult.getData();
            FinancialStatementVo titleColumn = new FinancialStatementVo("科目", genTitleName(titles));
            data.add(titleColumn);

            // find year's track records belong to this portfolio
            condition = new HashMap<>();
            condition.put("portfolioId", uid);
            condition.put("type", PortfolioUtils.FinancialDataType.YEAR);
//            condition.put("count", PortfolioUtils.FinancialCount.NOT_RAW);
            ResultData trackResult = financialTrackDao.selectManualTrack(condition);
            /**
             * load last FY data
             */
            if(trackResult.getResponseCode() == ResponseCode.RESPONSE_OK) {
                List<FinancialTrack> tracks = (List<FinancialTrack>) trackResult.getData();
                // load last year data
                FinancialTrack latestTrack = tracks.get(0);
                List<Object> lastFYData = fetchColumnData(titles, latestTrack.getUid());
                FinancialStatementVo column = new FinancialStatementVo(latestTrack.getName(), lastFYData);
                data.add(column);

                /**
                 * make sure having second last FY data
                 * if having, add to column. otherwise add NA
                  */
                if(tracks.size() >1){
                    FinancialTrack secondLastFYTrack = tracks.get(1);
                    List<Object> secondLastFYData = fetchColumnData(titles, secondLastFYTrack.getUid());
                    column = new FinancialStatementVo("YoY", genPercentageColumn(lastFYData, secondLastFYData));
                } else {
                    column = new FinancialStatementVo("YoY", genNAColumn(titles.size()));
                }
                data.add(column);
            }

            /**
             * load latest track data
             */
            condition = new HashMap<>();
            condition.put("portfolioId", uid);
            trackResult = financialTrackDao.selectRawTrack(condition);
            if(trackResult.getResponseCode() == ResponseCode.RESPONSE_OK) {
                List<FinancialTrack> tracks = (List<FinancialTrack>) trackResult.getData();

                FinancialTrack latestTrack = tracks.get(0);
                List<Object> latestData = fetchColumnData(titles, latestTrack.getUid());
                FinancialStatementVo column = new FinancialStatementVo(latestTrack.getName(), latestData);
                data.add(column);
                FinancialTrack secondLastTrack = tracks.get(1);
                List<Object> secondLastData = fetchColumnData(titles, secondLastTrack.getUid());
                /**
                 * load MoM 环比
                 */
                List<Object> percentage;
                if(latestTrack.getType() == secondLastTrack.getType()){
                    percentage = genPercentageColumn(latestData, secondLastData);
                }else{
                    percentage = genNAColumn(latestData.size());
                }
                column = new FinancialStatementVo("环比", percentage);
                data.add(column);
                /**
                 * load YoY 同比
                 */
                int lastYearThisMonth = latestTrack.getDate() - 100;
                condition = new HashMap<>();
                condition.put("portfolioId", uid);
                condition.put("date", lastYearThisMonth);
                ResultData lastYearThisMonthTrackResult = financialTrackDao.selectRawTrack(condition);
                if (lastYearThisMonthTrackResult.getResponseCode() == ResponseCode.RESPONSE_OK) {
                    FinancialTrack lastYearThisMonthTrack = ((List<FinancialTrack>) lastYearThisMonthTrackResult.getData())
                            .get(0);
                    List<Object> lastYearThisMonthData = fetchColumnData(titles, lastYearThisMonthTrack.getUid());
                    if (lastYearThisMonthTrack.getType() == latestTrack.getType()) {
                        percentage = genPercentageColumn(latestData, lastYearThisMonthData);
                    } else {
                        percentage = genNAColumn(latestData.size());
                    }
                    column = new FinancialStatementVo("同比", percentage);
                    data.add(column);
                }
            }
            resultData.setData(data);
            resultData.setResponseCode(ResponseCode.RESPONSE_OK);
            return resultData;
        }
        return null;
    }

    private ResultData getData(int uid, int sheetType){
        ResultData resultData = new ResultData();
        List<FinancialStatementVo> data = new ArrayList<>();
        // the first n columns are static in web page
        int firstNColumns = 1;

        // select all financial sheets' titles belong to this portfolio
        ResultData titleResult = financialTitleDao.selectByPortfolioIdAndSheetType(uid, sheetType);
        if(titleResult.getResponseCode() == ResponseCode.RESPONSE_OK){
            // add the first column: financial titles
            List<FinancialTitle> titles = (List<FinancialTitle>) titleResult.getData();
            FinancialStatementVo titleColumn = new FinancialStatementVo("科目", genTitleName(titles));
            data.add(titleColumn);

            // find track records belong to this portfolio
            Map<String, Object> condition = new HashMap<>();
            condition.put("portfolioId", uid);
            ResultData trackResult = financialTrackDao.selectRawTrack(condition);
            if(trackResult.getResponseCode() == ResponseCode.RESPONSE_OK){
                List<FinancialTrack> tracks = (List<FinancialTrack>) trackResult.getData();

                FinancialTrack latestTrack = tracks.get(0);
                List<Object> latestData = fetchColumnData(titles, latestTrack.getUid());
                FinancialStatementVo column = new FinancialStatementVo(latestTrack.getName(), latestData);
                data.add(column); firstNColumns ++;

                FinancialTrack secondLastTrack = tracks.get(1);
                List<Object> secondLastData = fetchColumnData(titles, secondLastTrack.getUid());
                column = new FinancialStatementVo(secondLastTrack.getName(), secondLastData);
                data.add(column); firstNColumns ++;

                /**
                 * load 同比 data, 同比 contains more than MoM, including QoQ, etc...
                 */
                List<Object> percentage;
                if(latestTrack.getType() == secondLastTrack.getType()){
                    percentage = genPercentageColumn(latestData, secondLastData);
                }else{
                    percentage = genNAColumn(latestData.size());
                }
                column = new FinancialStatementVo("环比", percentage);
                data.add(column); firstNColumns ++;

                /**
                 * load 同比 data if 同比 exists
                 * my special data structure: use int to represent year and month, such as 201810
                 * so the last year this month equals 201810 - 100 = 201710
                 */
                int lastYearThisMonth = latestTrack.getDate() - 100;
                condition = new HashMap<>();
                condition.put("portfolioId", uid);
                condition.put("date", lastYearThisMonth);
                ResultData lastYearThisMonthTrackResult = financialTrackDao.selectRawTrack(condition);
                if (lastYearThisMonthTrackResult.getResponseCode() == ResponseCode.RESPONSE_OK) {
                    FinancialTrack lastYearThisMonthTrack = ((List<FinancialTrack>) lastYearThisMonthTrackResult.getData())
                            .get(0);
                    /**
                     * add last year this month data column
                     */
                    List<Object> lastYearThisMonthData = fetchColumnData(titles, lastYearThisMonthTrack.getUid());
                    column = new FinancialStatementVo(lastYearThisMonthTrack.getName(), lastYearThisMonthData);
                    data.add(column); firstNColumns++;
                    /**
                     * add last year this month 环比 percentage
                     */
                    if (lastYearThisMonthTrack.getType() == latestTrack.getType()) {
                        percentage = genPercentageColumn(latestData, lastYearThisMonthData);
                    } else {
                        percentage = genNAColumn(latestData.size());
                    }
                    column = new FinancialStatementVo("同比", percentage);
                    data.add(column); firstNColumns++;
                }
                if(sheetType == PortfolioUtils.FinancialStatementType.PROFIT_LOSS){
                    /**
                     * load YTD data if exists
                     */
                    int startDate = (latestTrack.getDate()/100) * 100;
                    int endDate = (latestTrack.getDate()/100 + 1) * 100;
                    List<Object> ytdData = genYTDColumn(titles, startDate, endDate);
                    if(ytdData != null){
                        column = new FinancialStatementVo((latestTrack.getDate()/100) + "YTD", ytdData);
                        data.add(column); firstNColumns++;
                    }
                    startDate = startDate - 100;
                    endDate = startDate + latestTrack.getDate() % 100;
                    List<Object> lastYTDData = genYTDColumn(titles, startDate, endDate);
                    if(lastYTDData != null){
                        column = new FinancialStatementVo((startDate/100) + "YTD", lastYTDData);
                        data.add(column); firstNColumns++;
                    }
                    if(ytdData != null && lastYTDData != null){
                        column = new FinancialStatementVo("YoY", genPercentageColumn(ytdData, lastYTDData));
                        data.add(column); firstNColumns++;
                    }
                }



                /**
                 * load this year budget number
                 */


                for(FinancialTrack track : tracks){
                    FinancialStatementVo thisColumn = new FinancialStatementVo(track.getName(),
                            fetchColumnData(titles, track.getUid()));
                    data.add(thisColumn);
                }
                resultData.setData(data);
                resultData.setResponseCode(ResponseCode.RESPONSE_OK);
                resultData.setDescription(String.valueOf(firstNColumns));
                return resultData;
            }
        }
        return null;
    }

    private List<Object> genTitleName(List<FinancialTitle> titles){
        List<Object> titleNames = new ArrayList<>();
        for(FinancialTitle title : titles){
            titleNames.add(title.getName());
        }
        return titleNames;
    }

    private List<Object> genMOMColumn(FinancialTrack current){
        return null;
    }

    private List<Object> genYOYColumn(FinancialTrack current){
        return null;
    }

    private List<Object> genYTDColumn(List<FinancialTitle> titles, int start, int end){
        List<Object> ytdData = new ArrayList<>();
        Map<String, Object> condition = new HashMap<>();
        condition.put("startDate", start);
        condition.put("endDate", end);
        ResultData ytdTrackResult = financialTrackDao.selectRawTrack(condition);
        if(ytdTrackResult.getResponseCode() == ResponseCode.RESPONSE_OK) {
            List<FinancialTrack> ytdTracks = (List<FinancialTrack>) ytdTrackResult.getData();
            for (FinancialTitle title : titles) {
                Long ytdNumber = Long.valueOf(0);
                for (FinancialTrack track : ytdTracks) {
                    ResultData result = financialDataDao.selectByTitleAndTrackId(title.getUid(), track.getUid());
                    ytdNumber += ((List<FinancialData>) result.getData()).get(0).getNumber();
                }
                ytdData.add(ytdNumber);
            }
            return ytdData;
        }else {
            return null;
        }
    }

    private List<Object> genNAColumn(int size){
        List<Object> naList = new ArrayList<>();
        for(int i=0; i<size; i++){
            naList.add("NA");
        }
        return naList;
    }

    private List<Object> genPercentageColumn(List<Object> numerator, List<Object> denominator){
        if(numerator.size() == denominator.size()){
            List<Object> percentage = new ArrayList<>();
            for(int i=0; i<numerator.size(); i++){
                Long l1 = (Long) numerator.get(i);
                Long l2 = (Long) denominator.get(i);
                if(l2 == 0l){
                    percentage.add("-");
                    continue;
                }
                double percent = l1.doubleValue()/l2.doubleValue() - 1.0;
                NumberFormat nf = java.text.NumberFormat.getPercentInstance();
                nf.setMinimumFractionDigits(2);     // 小数点后保留几位
                percentage.add(nf.format(percent));
            }
            return percentage;
        }
        return null;
    }

    private List<Object> fetchColumnData(List<FinancialTitle> titles, int trackId){
        List<Object> financialData = new ArrayList<>();

        for(FinancialTitle title : titles){
            ResultData result = financialDataDao.selectByTitleAndTrackId(title.getUid(), trackId);
            financialData.add(((List<FinancialData>)result.getData()).get(0).getNumber());
        }
        return financialData;
    }

    private String getFundNameById(int id){
        ResultData resultData = fundDao.selectByUid(id);
        if(resultData.getResponseCode() == ResponseCode.RESPONSE_OK){
            return ((Fund)resultData.getData()).getName();
        }
        return "Fund Name Error";
    }
}
