package com.example.vo;

import com.example.entity.Portfolio;

/**
 * Description: portfolio view object, see fields:
 *     shareType, investType, moneyType, exitStatus, exitType,
 * Created by Floyd on 2019/2/12 16:28
 */
public class PortfolioVo {
    private int uid;
    private String name;
    private String fundName;
    private String date;
    private String shareType;
    private String investType;
    private String boardNum;
    private String round;
    private String partner;
    private String moneyType;
    private int investNum;
    private String investRatio;
    private String currentRatio;
    private String source;
    private String director;
    private String manager;
    private String boarder;
    private String industry;
    private String sector;
    private String location;
    private String registerLocation;
    private String intro;
    private String exitStatus;
    private String exitType;
    private String exitTime;
    private int valueAchieved;
    private int valueAchieving;
    private int totalValue;
    private double returnMultiple;
    private double irr;
    private String valueEvidence;
    private boolean financeData;

    public PortfolioVo(Portfolio portfolio){
        this.uid = portfolio.getUid();
        this.name = portfolio.getName();
        this.fundName = String.valueOf(portfolio.getFundId());
        this.date = portfolio.getDate();
        this.shareType = portfolio.getShareType();
        this.investType = portfolio.getInvestType();
        this.boardNum = portfolio.getBoardNum();
        this.round = portfolio.getRound();
        this.partner = portfolio.getInvestPartner();
        this.moneyType = portfolio.getMoneyType();
        this.investNum = portfolio.getInvestNum();
        this.investRatio = portfolio.getInvestRatio();
        this.currentRatio = portfolio.getCurrentRatio();
        this.source = portfolio.getSource();
        this.director = portfolio.getPartner();
        this.manager = portfolio.getManager();
        this.boarder = portfolio.getBoarder();
        this.industry = portfolio.getIndustry();
        this.sector = portfolio.getSector();
        this.location = portfolio.getLocation();
        this.registerLocation = portfolio.getRegisterLocation();
        this.intro = portfolio.getIntro();
        this.exitStatus = portfolio.getExitStatus();
        this.exitType = portfolio.getExitType();
        this.exitTime = portfolio.getExitTime();
        this.valueAchieved = portfolio.getValueAchieved();
        this.valueAchieving = portfolio.getValueAchieving();
        this.totalValue = portfolio.getTotalValue();
        this.returnMultiple = portfolio.getReturnMultiple();
        this.irr = portfolio.getIrr();
        this.valueEvidence = portfolio.getValueEvidence();
        this.financeData = portfolio.getFinanceData();
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFundName() {
        return fundName;
    }

    public void setFundName(String fundName) {
        this.fundName = fundName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getShareType() {
        return shareType;
    }

    public void setShareType(String shareType) {
        this.shareType = shareType;
    }

    public String getInvestType() {
        return investType;
    }

    public void setInvestType(String investType) {
        this.investType = investType;
    }


    public String getRound() {
        return round;
    }

    public void setRound(String round) {
        this.round = round;
    }

    public String getPartner() {
        return partner;
    }

    public void setPartner(String partner) {
        this.partner = partner;
    }

    public String getMoneyType() {
        return moneyType;
    }

    public void setMoneyType(String moneyType) {
        this.moneyType = moneyType;
    }

    public int getInvestNum() {
        return investNum;
    }

    public void setInvestNum(int investNum) {
        this.investNum = investNum;
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

    public String getExitStatus() {
        return exitStatus;
    }

    public void setExitStatus(String exitStatus) {
        this.exitStatus = exitStatus;
    }

    public String getExitType() {
        return exitType;
    }

    public void setExitType(String exitType) {
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

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getBoardNum() {
        return boardNum;
    }

    public void setBoardNum(String boardNum) {
        this.boardNum = boardNum;
    }

    public String getInvestRatio() {
        return investRatio;
    }

    public void setInvestRatio(String investRatio) {
        this.investRatio = investRatio;
    }

    public String getCurrentRatio() {
        return currentRatio;
    }

    public void setCurrentRatio(String currentRatio) {
        this.currentRatio = currentRatio;
    }

    public boolean isFinanceData() {
        return financeData;
    }

    public void setFinanceData(boolean financeData) {
        this.financeData = financeData;
    }
}
