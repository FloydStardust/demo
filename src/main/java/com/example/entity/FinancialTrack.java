package com.example.entity;


/**
 * Description:
 * Created by Floyd on 2019/2/21 16:28
 */
public class FinancialTrack extends Entity {

    private int uid;

    private int portfolioId;

    /**
     * the track count, begin from 0, which represents the first month/quarter/n-months we track...
     */
    private int count;

    /**
     * the financial data type: 0 for month, 1 for quarter, 2 for half-year, 3 for 3-quarter, 4 for year, 5 for irregular
     */
    private int type;

    private int date;

    private String name;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPortfolioId() {
        return portfolioId;
    }

    public void setPortfolioId(int portfolioId) {
        this.portfolioId = portfolioId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getDate() {
        return date;
    }

    public void setDate(int date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
