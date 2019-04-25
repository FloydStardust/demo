package com.example.entity;

/**
 * Description: 进入DD阶段的项目
 * Created by Floyd on 2019/4/24 14:57
 */
public class Project extends Entity{
    private int uid;
    private String name;
    private int fund;
    private String manager;

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

    public int getFund() {
        return fund;
    }

    public void setFund(int fund) {
        this.fund = fund;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }
}
