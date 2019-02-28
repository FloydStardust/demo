package com.example.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Description: demo
 * Created by Floyd on 2019/2/10 16:51
 */
public class PortfolioUtils {


    /**
     * 0 for Balance Sheet, 1 for Profit & Loss, 2 for Cash Flow, 3 for Change in Statement
     */
    public static class FinancialStatementType {
        public static int BALANCE_SHEET = 0;
        public static int PROFIT_LOSS = 1;
        public static int CASH_FLOW = 2;
        public static int CHANGE = 3;
    }

    /**
     * the financial data type: 0 for month, 1 for quarter, 2 for half-year, 3 for 3-quarter, 4 for year, 5 for irregular
     */
    public static class FinancialDataType {
        public static int MONTH = 0;
        public static int QUARTER = 1;
        public static int HALF_YEAR = 2;
        public static int THREE_QUARTER = 3;
        public static int YEAR = 4;
        public static int IRREGULAR  =5;
    }

    /**
     * The financial track count type, positive number for real track count while 0 for manual track
     */
    public static class FinancialCount {
        public static int NOT_RAW = 0;
    }

    /**
     * The importance of this row, to show if bold: 0 for normal, 1 for bold, 2 for summary
     */
    public static class FinancialTitleImportance {
        public static int NORAML = 0;
        public static int BOLD = 1;
        public static int SUMMARY = 2;
    }

//    /**
//     * The portfolio status: 0 for normal(not listed), 1 HK, 2 for NYSE
//     */
//    public static class IPO_STATUS {
//        public static int NOT_LIST = 0;
//        public static int HK = 1;
//        public static int NYSE = 2;
//        public static Map<Integer, String> toMap(){
//            Map<Integer, String> ipoStatus = new HashMap<>();
//            ipoStatus.put(0, "未上市");
//            ipoStatus.put(1, "HK");
//            ipoStatus.put(2, "NYSE");
//            return ipoStatus;
//        }
//    }
//
//    public enum ShareType {
//        COMMON("普通股", 1), PREFERRED("优先股", 2),
//        CHANGE("可转债", 3);
//        private String name;
//        private int index;
//
//        private ShareType(String name, int index){
//            this.name = name;
//            this.index = index;
//        }
//
//        public String getName() {
//            return name;
//        }
//
//        public void setName(String name) {
//            this.name = name;
//        }
//
//        public int getIndex() {
//            return index;
//        }
//
//        public void setIndex(int index) {
//            this.index = index;
//        }
//    }
//
//    public enum InvestType {
//        LEAD("领投",1), FOLLOW("跟投",2);
//        private String name;
//        private int index;
//        private InvestType(String name, int index) {
//            this.name = name;
//            this.index = index;
//        }
//
//        public String getName() {
//            return name;
//        }
//
//        public void setName(String name) {
//            this.name = name;
//        }
//
//        public int getIndex() {
//            return index;
//        }
//
//        public void setIndex(int index) {
//            this.index = index;
//        }
//    }
//
//    public enum MoneyType {
//        DOLLAR("美元", 1), RMB("人民币",2);
//        private String name;
//        private int index;
//        private MoneyType(String name, int index){
//            this.name = name;
//            this.index = index;
//        }
//
//        public String getName() {
//            return name;
//        }
//
//        public void setName(String name) {
//            this.name = name;
//        }
//
//        public int getIndex() {
//            return index;
//        }
//
//        public void setIndex(int index) {
//            this.index = index;
//        }
//    }
//
//    public enum ExitStatus {
//        EXIT("已退出",1), PART_EXIT("部分退出",2), NOT_EXIT("未退出",0);
//
//        private String name;
//        private int index;
//        private ExitStatus(String name, int index){
//            this.name = name;
//            this.index = index;
//        }
//
//        public String getName() {
//            return name;
//        }
//
//        public void setName(String name) {
//            this.name = name;
//        }
//
//        public int getIndex() {
//            return index;
//        }
//
//        public void setIndex(int index) {
//            this.index = index;
//        }
//    }
//
//    public enum ExitTye {
//        IPO("IPO", 1), MERGE("并购",2), NOT_EXIT("未退出",0);
//        private String name;
//        private int index;
//        private ExitTye(String name, int index){
//            this.name = name;
//            this.index = index;
//        }
//
//        public String getName() {
//            return name;
//        }
//
//        public void setName(String name) {
//            this.name = name;
//        }
//
//        public int getIndex() {
//            return index;
//        }
//
//        public void setIndex(int index) {
//            this.index = index;
//        }
//    }

}

