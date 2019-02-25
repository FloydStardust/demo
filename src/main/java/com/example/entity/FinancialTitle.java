package com.example.entity;

/**
 * Description: Financial Table Titles
 * Created by Floyd on 2019/2/20 11:12
 */
public class FinancialTitle extends Entity{

    private int uid;

    private int portfolioId;

    /**
     * Financial statement title name, such as: 固定资产, 营业成本, etc
     */
    private String name;

    /**
     * This title belong to: 0 for Balance Sheet, 1 for Profit & Loss, 2 for Cash Flow, 3 for Change in Statement
     */
    private int belongTo;

    /**
     * The row number of this title in a financial statement
     */
    private int rank;

    /**
     * The importance of this row, to show if bold: 0 for normal, 1 for bold, 2 for summary
     */
    private int importance;


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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBelongTo() {
        return belongTo;
    }

    public void setBelongTo(int belongTo) {
        this.belongTo = belongTo;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public int getImportance() {
        return importance;
    }

    public void setImportance(int importance) {
        this.importance = importance;
    }
}
