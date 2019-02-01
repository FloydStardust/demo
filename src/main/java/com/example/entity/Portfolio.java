package com.example.entity;

/**
 * Description: Portfolio Entity with an uid
 * Created by Floyd on 2019/1/25 10:59
 */
public class Portfolio extends Entity{

    private int uid;
    private String name;
    private Long fundId;
    private String date;
    private int shareType;
    private int investType;
    private int boardNum;
    private int roundNum;
    private String partner;
    private int moneyType;
    private int investNum;
    private double investRatio;
    private double currentRatio;
    private String source;
    private String director;
    private String manager;
    private String boarder;
    private String industry;
    private String sector;
    private String location;
    private String registerLocation;
    private int exitStatus;
    private int exitType;
    private String exitTime;
    private int valueAchieved;
    private int valueAchieving;
    private int totalValue;
    private double returnMultiple;
    private double irr;
    private String valueEvidence;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public enum ShareType {
        COMMON("普通人", 1), PREFERRED("优先股", 2);
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
        EXIT("已退出",1), PART_EXIT("部分退出",2), NOT_EXIT("未退出",3);

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
        IPO("IPO", 1), MERGE("并购",2);
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getFundId() {
        return fundId;
    }

    public void setFundId(Long fundId) {
        this.fundId = fundId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getShareType() {
        return shareType;
    }

    public void setShareType(int shareType) {
        this.shareType = shareType;
    }

    public int getInvestType() {
        return investType;
    }

    public void setInvestType(int investType) {
        this.investType = investType;
    }

    public int getBoardNum() {
        return boardNum;
    }

    public void setBoardNum(int boardNum) {
        this.boardNum = boardNum;
    }

    public int getRoundNum() {
        return roundNum;
    }

    public void setRoundNum(int roundNum) {
        this.roundNum = roundNum;
    }

    public String getPartner() {
        return partner;
    }

    public void setPartner(String partner) {
        this.partner = partner;
    }

    public int getMoneyType() {
        return moneyType;
    }

    public void setMoneyType(int moneyType) {
        this.moneyType = moneyType;
    }

    public int getInvestNum() {
        return investNum;
    }

    public void setInvestNum(int investNum) {
        this.investNum = investNum;
    }

    public double getInvestRatio() {
        return investRatio;
    }

    public void setInvestRatio(double investRatio) {
        this.investRatio = investRatio;
    }

    public double getCurrentRatio() {
        return currentRatio;
    }

    public void setCurrentRatio(double currentRatio) {
        this.currentRatio = currentRatio;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getBoarder() {
        return boarder;
    }

    public void setBoarder(String boarder) {
        this.boarder = boarder;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getRegisterLocation() {
        return registerLocation;
    }

    public void setRegisterLocation(String registerLocation) {
        this.registerLocation = registerLocation;
    }

    public int getExitStatus() {
        return exitStatus;
    }

    public void setExitStatus(int exitStatus) {
        this.exitStatus = exitStatus;
    }

    public int getExitType() {
        return exitType;
    }

    public void setExitType(int exitType) {
        this.exitType = exitType;
    }

    public String getExitTime() {
        return exitTime;
    }

    public void setExitTime(String exitTime) {
        this.exitTime = exitTime;
    }

    public int getValueAchieved() {
        return valueAchieved;
    }

    public void setValueAchieved(int valueAchieved) {
        this.valueAchieved = valueAchieved;
    }

    public int getValueAchieving() {
        return valueAchieving;
    }

    public void setValueAchieving(int valueAchieving) {
        this.valueAchieving = valueAchieving;
    }

    public int getTotalValue() {
        return totalValue;
    }

    public void setTotalValue(int totalValue) {
        this.totalValue = totalValue;
    }

    public double getReturnMultiple() {
        return returnMultiple;
    }

    public void setReturnMultiple(double returnMultiple) {
        this.returnMultiple = returnMultiple;
    }

    public double getIrr() {
        return irr;
    }

    public void setIrr(double irr) {
        this.irr = irr;
    }

    public String getValueEvidence() {
        return valueEvidence;
    }

    public void setValueEvidence(String valueEvidence) {
        this.valueEvidence = valueEvidence;
    }
}
