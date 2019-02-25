package com.example.entity;

import java.util.Date;

/**
 * Description: Financial Statement data
 * Created by Floyd on 2019/2/20 14:12
 */
public class FinancialData extends Entity {

    private int uid;

    private int titleId;

    private int date;

    private int fyDate;

    /**
     * the track count, begin from 0, which represents the first month/quarter/n months we track...
     */
    private int trackId;

    /**
     * the financial data type: 0 for month, 1 for quarter, 2 for half-year, 3 for 3-quarter, 4 for year, 5 for irregular
     */
    private int dataType;

    /**
     * the money type of financial data: 0 for RMB, 1 for dollar
     */
    private int moneyType;

    /**
     * The account number
     */
    private long number;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getTitleId() {
        return titleId;
    }

    public void setTitleId(int titleId) {
        this.titleId = titleId;
    }

    public int getDate() {
        return date;
    }

    public void setDate(int date) {
        this.date = date;
    }

    public int getFyDate() {
        return fyDate;
    }

    public void setFyDate(int fyDate) {
        this.fyDate = fyDate;
    }

    public int getDataType() {
        return dataType;
    }

    public void setDataType(int dataType) {
        this.dataType = dataType;
    }

    public int getMoneyType() {
        return moneyType;
    }

    public void setMoneyType(int moneyType) {
        this.moneyType = moneyType;
    }

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public int getTrackId() {
        return trackId;
    }

    public void setTrackId(int trackId) {
        this.trackId = trackId;
    }
}

