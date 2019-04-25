package com.example.vo;

import com.example.entity.Vendor;

import java.util.List;

/**
 * Description:
 * Created by Floyd on 2019/4/24 15:41
 */
public class VendorVo {
    private int uid;
    private String fund;
    private String name;
    private String manager;
    private List<Vendor> vendors;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getFund() {
        return fund;
    }

    public void setFund(String fund) {
        this.fund = fund;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public List<Vendor> getVendors() {
        return vendors;
    }

    public void setVendors(List<Vendor> vendors) {
        this.vendors = vendors;
    }
}
