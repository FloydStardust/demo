package com.example.entity;

import java.sql.Date;

/**
 * Description: Profit and loss table item
 * Created by Floyd on 2019/1/29 17:40
 */
public class Profit extends Entity{

    private int uid;

    private int portfolioId;

    private int type;

    private Date date;

    private Date fyDate;

    private int revenue;

    private int cogs;

    private int grossProfit;

    private int operatingTax;

    private int sellingExpense;

    private int adminExpense;

    private int financialExpense;

    private int assetLoss;

    private int fairValueChange;

    private int investmentIncome;

    private int otherIncome;

    private int operatingIncome;

    private int nonOperatingIncome;

    private int nonOperatingExpense;

    private int incomeBeforeTax;

    private int incomeTax;

    private int netIncome;

    private int grossIncome;

    private double sellingExpenseRatio;

    private double adminExpenseRatio;

    private double netIncomeRatio;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPortfolioId() {
        return portfolioId;
    }

    public void setPortfolioId(int portfolioId) {
        this.portfolioId = portfolioId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getFyDate() {
        return fyDate;
    }

    public void setFyDate(Date fyDate) {
        this.fyDate = fyDate;
    }

    public int getRevenue() {
        return revenue;
    }

    public void setRevenue(int revenue) {
        this.revenue = revenue;
    }

    public int getCogs() {
        return cogs;
    }

    public void setCogs(int cogs) {
        this.cogs = cogs;
    }

    public int getGrossProfit() {
        return grossProfit;
    }

    public void setGrossProfit(int grossProfit) {
        this.grossProfit = grossProfit;
    }

    public int getOperatingTax() {
        return operatingTax;
    }

    public void setOperatingTax(int operatingTax) {
        this.operatingTax = operatingTax;
    }

    public int getSellingExpense() {
        return sellingExpense;
    }

    public void setSellingExpense(int sellingExpense) {
        this.sellingExpense = sellingExpense;
    }

    public int getAdminExpense() {
        return adminExpense;
    }

    public void setAdminExpense(int adminExpense) {
        this.adminExpense = adminExpense;
    }

    public int getFinancialExpense() {
        return financialExpense;
    }

    public void setFinancialExpense(int financialExpense) {
        this.financialExpense = financialExpense;
    }

    public int getAssetLoss() {
        return assetLoss;
    }

    public void setAssetLoss(int assetLoss) {
        this.assetLoss = assetLoss;
    }

    public int getFairValueChange() {
        return fairValueChange;
    }

    public void setFairValueChange(int fairValueChange) {
        this.fairValueChange = fairValueChange;
    }

    public int getInvestmentIncome() {
        return investmentIncome;
    }

    public void setInvestmentIncome(int investmentIncome) {
        this.investmentIncome = investmentIncome;
    }

    public int getOtherIncome() {
        return otherIncome;
    }

    public void setOtherIncome(int otherIncome) {
        this.otherIncome = otherIncome;
    }

    public int getOperatingIncome() {
        return operatingIncome;
    }

    public void setOperatingIncome(int operatingIncome) {
        this.operatingIncome = operatingIncome;
    }

    public int getNonOperatingIncome() {
        return nonOperatingIncome;
    }

    public void setNonOperatingIncome(int nonOperatingIncome) {
        this.nonOperatingIncome = nonOperatingIncome;
    }

    public int getNonOperatingExpense() {
        return nonOperatingExpense;
    }

    public void setNonOperatingExpense(int nonOperatingExpense) {
        this.nonOperatingExpense = nonOperatingExpense;
    }

    public int getIncomeBeforeTax() {
        return incomeBeforeTax;
    }

    public void setIncomeBeforeTax(int incomeBeforeTax) {
        this.incomeBeforeTax = incomeBeforeTax;
    }

    public int getIncomeTax() {
        return incomeTax;
    }

    public void setIncomeTax(int incomeTax) {
        this.incomeTax = incomeTax;
    }

    public int getNetIncome() {
        return netIncome;
    }

    public void setNetIncome(int netIncome) {
        this.netIncome = netIncome;
    }

    public int getGrossIncome() {
        return grossIncome;
    }

    public void setGrossIncome(int grossIncome) {
        this.grossIncome = grossIncome;
    }

    public double getSellingExpenseRatio() {
        return sellingExpenseRatio;
    }

    public void setSellingExpenseRatio(double sellingExpenseRatio) {
        this.sellingExpenseRatio = sellingExpenseRatio;
    }

    public double getAdminExpenseRatio() {
        return adminExpenseRatio;
    }

    public void setAdminExpenseRatio(double adminExpenseRatio) {
        this.adminExpenseRatio = adminExpenseRatio;
    }

    public double getNetIncomeRatio() {
        return netIncomeRatio;
    }

    public void setNetIncomeRatio(double netIncomeRatio) {
        this.netIncomeRatio = netIncomeRatio;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
