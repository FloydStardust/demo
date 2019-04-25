package com.example.vo;

import com.example.entity.Vendor;

/**
 * Description:
 * Created by Floyd on 2019/4/24 15:59
 */
public class VendorListVo {

    private int uid;
    private String project;
    private Vendor financialVendor;
    private Vendor lawVendor;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public Vendor getFinancialVendor() {
        return financialVendor;
    }

    public void setFinancialVendor(Vendor financialVendor) {
        this.financialVendor = financialVendor;
    }

    public Vendor getLawVendor() {
        return lawVendor;
    }

    public void setLawVendor(Vendor lawVendor) {
        this.lawVendor = lawVendor;
    }
}
