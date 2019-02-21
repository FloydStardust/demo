package com.example.entity;

import java.util.Date;

/**
 * Description: Financial Statement datas
 * Created by Floyd on 2019/2/20 14:12
 */
public class FinancialData extends Entity {

    private int uid;

    private int titleId;

    private Date date;

    private Date fyDate;

    /**
     * the financial data type: 0 for month, 1 for quarter, 2 for half-year, 3 for year
     */
    private int dataType;

    /**
     * the money type of financial datas: 0 for RMB, 1 for dollar
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
}

