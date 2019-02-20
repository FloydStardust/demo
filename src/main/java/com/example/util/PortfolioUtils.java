package com.example.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Description: demo
 * Created by Floyd on 2019/2/10 16:51
 */
public class PortfolioUtils {

    public static Map<Integer, String> IPO_STATUS = new HashMap<Integer, String>(){
        {
            put(0, "未上市");
            put(1, "HY");
            put(2, "NYSE");
        }
    };


    public enum ShareType {
        COMMON("普通股", 1), PREFERRED("优先股", 2);
        private String name;
        private int index;

        private ShareType(String name, int index){
            this.name = name;
            this.index = index;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }

    public enum InvestType {
        LEAD("领投",1), FOLLOW("跟投",2);
        private String name;
        private int index;
        private InvestType(String name, int index) {
            this.name = name;
            this.index = index;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }

    public enum MoneyType {
        DOLLAR("美元", 1), RMB("人民币",2);
        private String name;
        private int index;
        private MoneyType(String name, int index){
            this.name = name;
            this.index = index;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }

    public enum ExitStatus {
        EXIT("已退出",1), PART_EXIT("部分退出",2), NOT_EXIT("未退出",0);

        private String name;
        private int index;
        private ExitStatus(String name, int index){
            this.name = name;
            this.index = index;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }

    public enum ExitTye {
        IPO("IPO", 1), MERGE("并购",2), NOT_EXIT("未退出",0);
        private String name;
        private int index;
        private ExitTye(String name, int index){
            this.name = name;
            this.index = index;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }

}

