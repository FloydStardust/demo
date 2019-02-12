package com.example.vo;

import java.util.Map;

/**
 * Description: I'm dying...
 * Created by Floyd on 2019/2/10 17:18
 */
public class AddPortfolioFieldsVo {
    private Map<Integer, String> funds;
    private Map<Integer, String> shareType;
    private Map<Integer, String> investType;
    private Map<Integer, String> moneyType;
    private Map<Integer, String> exitStatus;
    private Map<Integer, String> exitType;

    public AddPortfolioFieldsVo() {
    }

    public Map<Integer, String> getFunds() {
        return funds;
    }

    public void setFunds(Map<Integer, String> funds) {
        this.funds = funds;
    }

    public Map<Integer, String> getShareType() {
        return shareType;
    }

    public void setShareType(Map<Integer, String> shareType) {
        this.shareType = shareType;
    }

    public Map<Integer, String> getInvestType() {
        return investType;
    }

    public void setInvestType(Map<Integer, String> investType) {
        this.investType = investType;
    }

    public Map<Integer, String> getMoneyType() {
        return moneyType;
    }

    public void setMoneyType(Map<Integer, String> moneyType) {
        this.moneyType = moneyType;
    }

    public Map<Integer, String> getExitStatus() {
        return exitStatus;
    }

    public void setExitStatus(Map<Integer, String> exitStatus) {
        this.exitStatus = exitStatus;
    }

    public Map<Integer, String> getExitType() {
        return exitType;
    }

    public void setExitType(Map<Integer, String> exitType) {
        this.exitType = exitType;
    }
}
