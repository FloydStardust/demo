package com.example.entity;

import java.sql.Date;

/**
 * Description: Balance Sheet
 * Created by Floyd on 2019/2/14 13:31
 */
public class BalanceSheet extends Entity {

    private int uid;

    private int portfolioId;

    private Date date;

    private Date fyDate;

    private int monetary;

    private int financialAssets;

    private int noteReceivable;

    private int accountReceivable;

    private int advancedPayment;

    private int interestReceivable;

    private int otherReceivable;

    private int inventory;

    private int otherCurrentAssets;

    private int totalCurrentAssets;

    private int longTermEquity;

    private int fixedAssets;

    private int construction;

    private int fixedAssetsDisposal;

    private int intangibleAssets;

    private int longTermPrepayment;

    private int deferredTaxAssets;

    private int otherNonCurrentAssets;

    private int totalNonCurrentAssets;

    private int totalAssets;

    private int shortTermLoan;

    private int financialLiabilities;

    private int notePayable;

    private int accountPayable;

    private int advancedReceivable;

    private int accruedPayroll;

    private int taxPayable;

    private int interestsPayable;

    private int dividendPayable;

    private int otherPayable;

    private int longTermLiabilitiesWithinYear;

    private int otherCurrentLiabilities;

    private int totalCurrentLiabilities;

    private int longTermLoan;

    private int longTermBonds;

    private int longTermPayable;

    private int specialPayable;

    private int accruedLiabilities;

    private int deferredReceivable;

    private int deferredTaxLiabilities;

    private int otherNonCurrentLiabilities;

    private int totalNonCurrentLiabilities;

    private int totalLiabilities;

    private int paidInCapital;

    private int capitalReserve;

    private int specialReverse;

    private int surplusReserve;

    private int undistributedProfit;

    private int minorityEquity;

    private int differencesInConversion;

    private int totalOwnerEquity;

    private int totalLiabilitiesAndEquity;

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

    public int getMonetary() {
        return monetary;
    }

    public void setMonetary(int monetary) {
        this.monetary = monetary;
    }

    public int getFinancialAssets() {
        return financialAssets;
    }

    public void setFinancialAssets(int financialAssets) {
        this.financialAssets = financialAssets;
    }

    public int getNoteReceivable() {
        return noteReceivable;
    }

    public void setNoteReceivable(int noteReceivable) {
        this.noteReceivable = noteReceivable;
    }

    public int getAccountReceivable() {
        return accountReceivable;
    }

    public void setAccountReceivable(int accountReceivable) {
        this.accountReceivable = accountReceivable;
    }

    public int getAdvancedPayment() {
        return advancedPayment;
    }

    public void setAdvancedPayment(int advancedPayment) {
        this.advancedPayment = advancedPayment;
    }

    public int getInterestReceivable() {
        return interestReceivable;
    }

    public void setInterestReceivable(int interestReceivable) {
        this.interestReceivable = interestReceivable;
    }

    public int getOtherReceivable() {
        return otherReceivable;
    }

    public void setOtherReceivable(int otherReceivable) {
        this.otherReceivable = otherReceivable;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public int getOtherCurrentAssets() {
        return otherCurrentAssets;
    }

    public void setOtherCurrentAssets(int otherCurrentAssets) {
        this.otherCurrentAssets = otherCurrentAssets;
    }

    public int getTotalCurrentAssets() {
        return totalCurrentAssets;
    }

    public void setTotalCurrentAssets(int totalCurrentAssets) {
        this.totalCurrentAssets = totalCurrentAssets;
    }

    public int getLongTermEquity() {
        return longTermEquity;
    }

    public void setLongTermEquity(int longTermEquity) {
        this.longTermEquity = longTermEquity;
    }

    public int getFixedAssets() {
        return fixedAssets;
    }

    public void setFixedAssets(int fixedAssets) {
        this.fixedAssets = fixedAssets;
    }

    public int getConstruction() {
        return construction;
    }

    public void setConstruction(int construction) {
        this.construction = construction;
    }

    public int getFixedAssetsDisposal() {
        return fixedAssetsDisposal;
    }

    public void setFixedAssetsDisposal(int fixedAssetsDisposal) {
        this.fixedAssetsDisposal = fixedAssetsDisposal;
    }

    public int getIntangibleAssets() {
        return intangibleAssets;
    }

    public void setIntangibleAssets(int intangibleAssets) {
        this.intangibleAssets = intangibleAssets;
    }

    public int getLongTermPrepayment() {
        return longTermPrepayment;
    }

    public void setLongTermPrepayment(int longTermPrepayment) {
        this.longTermPrepayment = longTermPrepayment;
    }

    public int getDeferredTaxAssets() {
        return deferredTaxAssets;
    }

    public void setDeferredTaxAssets(int deferredTaxAssets) {
        this.deferredTaxAssets = deferredTaxAssets;
    }

    public int getOtherNonCurrentAssets() {
        return otherNonCurrentAssets;
    }

    public void setOtherNonCurrentAssets(int otherNonCurrentAssets) {
        this.otherNonCurrentAssets = otherNonCurrentAssets;
    }

    public int getTotalNonCurrentAssets() {
        return totalNonCurrentAssets;
    }

    public void setTotalNonCurrentAssets(int totalNonCurrentAssets) {
        this.totalNonCurrentAssets = totalNonCurrentAssets;
    }

    public int getTotalAssets() {
        return totalAssets;
    }

    public void setTotalAssets(int totalAssets) {
        this.totalAssets = totalAssets;
    }

    public int getShortTermLoan() {
        return shortTermLoan;
    }

    public void setShortTermLoan(int shortTermLoan) {
        this.shortTermLoan = shortTermLoan;
    }

    public int getFinancialLiabilities() {
        return financialLiabilities;
    }

    public void setFinancialLiabilities(int financialLiabilities) {
        this.financialLiabilities = financialLiabilities;
    }

    public int getNotePayable() {
        return notePayable;
    }

    public void setNotePayable(int notePayable) {
        this.notePayable = notePayable;
    }

    public int getAccountPayable() {
        return accountPayable;
    }

    public void setAccountPayable(int accountPayable) {
        this.accountPayable = accountPayable;
    }

    public int getAdvancedReceivable() {
        return advancedReceivable;
    }

    public void setAdvancedReceivable(int advancedReceivable) {
        this.advancedReceivable = advancedReceivable;
    }

    public int getAccruedPayroll() {
        return accruedPayroll;
    }

    public void setAccruedPayroll(int accruedPayroll) {
        this.accruedPayroll = accruedPayroll;
    }

    public int getTaxPayable() {
        return taxPayable;
    }

    public void setTaxPayable(int taxPayable) {
        this.taxPayable = taxPayable;
    }

    public int getInterestsPayable() {
        return interestsPayable;
    }

    public void setInterestsPayable(int interestsPayable) {
        this.interestsPayable = interestsPayable;
    }

    public int getDividendPayable() {
        return dividendPayable;
    }

    public void setDividendPayable(int dividendPayable) {
        this.dividendPayable = dividendPayable;
    }

    public int getOtherPayable() {
        return otherPayable;
    }

    public void setOtherPayable(int otherPayable) {
        this.otherPayable = otherPayable;
    }

    public int getLongTermLiabilitiesWithinYear() {
        return longTermLiabilitiesWithinYear;
    }

    public void setLongTermLiabilitiesWithinYear(int longTermLiabilitiesWithinYear) {
        this.longTermLiabilitiesWithinYear = longTermLiabilitiesWithinYear;
    }

    public int getOtherCurrentLiabilities() {
        return otherCurrentLiabilities;
    }

    public void setOtherCurrentLiabilities(int otherCurrentLiabilities) {
        this.otherCurrentLiabilities = otherCurrentLiabilities;
    }

    public int getTotalCurrentLiabilities() {
        return totalCurrentLiabilities;
    }

    public void setTotalCurrentLiabilities(int totalCurrentLiabilities) {
        this.totalCurrentLiabilities = totalCurrentLiabilities;
    }

    public int getLongTermLoan() {
        return longTermLoan;
    }

    public void setLongTermLoan(int longTermLoan) {
        this.longTermLoan = longTermLoan;
    }

    public int getLongTermBonds() {
        return longTermBonds;
    }

    public void setLongTermBonds(int longTermBonds) {
        this.longTermBonds = longTermBonds;
    }

    public int getLongTermPayable() {
        return longTermPayable;
    }

    public void setLongTermPayable(int longTermPayable) {
        this.longTermPayable = longTermPayable;
    }

    public int getSpecialPayable() {
        return specialPayable;
    }

    public void setSpecialPayable(int specialPayable) {
        this.specialPayable = specialPayable;
    }

    public int getAccruedLiabilities() {
        return accruedLiabilities;
    }

    public void setAccruedLiabilities(int accruedLiabilities) {
        this.accruedLiabilities = accruedLiabilities;
    }

    public int getDeferredReceivable() {
        return deferredReceivable;
    }

    public void setDeferredReceivable(int deferredReceivable) {
        this.deferredReceivable = deferredReceivable;
    }

    public int getDeferredTaxLiabilities() {
        return deferredTaxLiabilities;
    }

    public void setDeferredTaxLiabilities(int deferredTaxLiabilities) {
        this.deferredTaxLiabilities = deferredTaxLiabilities;
    }

    public int getOtherNonCurrentLiabilities() {
        return otherNonCurrentLiabilities;
    }

    public void setOtherNonCurrentLiabilities(int otherNonCurrentLiabilities) {
        this.otherNonCurrentLiabilities = otherNonCurrentLiabilities;
    }

    public int getTotalNonCurrentLiabilities() {
        return totalNonCurrentLiabilities;
    }

    public void setTotalNonCurrentLiabilities(int totalNonCurrentLiabilities) {
        this.totalNonCurrentLiabilities = totalNonCurrentLiabilities;
    }

    public int getTotalLiabilities() {
        return totalLiabilities;
    }

    public void setTotalLiabilities(int totalLiabilities) {
        this.totalLiabilities = totalLiabilities;
    }

    public int getPaidInCapital() {
        return paidInCapital;
    }

    public void setPaidInCapital(int paidInCapital) {
        this.paidInCapital = paidInCapital;
    }

    public int getCapitalReserve() {
        return capitalReserve;
    }

    public void setCapitalReserve(int capitalReserve) {
        this.capitalReserve = capitalReserve;
    }

    public int getSpecialReverse() {
        return specialReverse;
    }

    public void setSpecialReverse(int specialReverse) {
        this.specialReverse = specialReverse;
    }

    public int getSurplusReserve() {
        return surplusReserve;
    }

    public void setSurplusReserve(int surplusReserve) {
        this.surplusReserve = surplusReserve;
    }

    public int getUndistributedProfit() {
        return undistributedProfit;
    }

    public void setUndistributedProfit(int undistributedProfit) {
        this.undistributedProfit = undistributedProfit;
    }

    public int getMinorityEquity() {
        return minorityEquity;
    }

    public void setMinorityEquity(int minorityEquity) {
        this.minorityEquity = minorityEquity;
    }

    public int getDifferencesInConversion() {
        return differencesInConversion;
    }

    public void setDifferencesInConversion(int differencesInConversion) {
        this.differencesInConversion = differencesInConversion;
    }

    public int getTotalOwnerEquity() {
        return totalOwnerEquity;
    }

    public void setTotalOwnerEquity(int totalOwnerEquity) {
        this.totalOwnerEquity = totalOwnerEquity;
    }

    public int getTotalLiabilitiesAndEquity() {
        return totalLiabilitiesAndEquity;
    }

    public void setTotalLiabilitiesAndEquity(int totalLiabilitiesAndEquity) {
        this.totalLiabilitiesAndEquity = totalLiabilitiesAndEquity;
    }
}
