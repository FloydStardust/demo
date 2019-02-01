package com.example.entity;


import javax.persistence.*;

/**
 * Description: demo
 * Created by Floyd on 2019/1/25 11:04
 */
public class Fund extends Entity{

    private int uid;
    private String name;
    private long account;
    private String startDate;

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

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public long getAccount() {
        return account;
    }

    public void setAccount(long account) {
        this.account = account;
    }
}
