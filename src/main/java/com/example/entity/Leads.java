package com.example.entity;

import java.util.Date;

/**
 * Description:
 * Created by Floyd on 2019/2/1 14:54
 */
public class Leads extends Entity {
    private int uid;
    private String name;
    private String source;
    private int partner;
    private int manager;
    private String company;
    private String industry;
    private String location;
    private String summary;
    private String description;
    private String revenue;
    private String netIncome;
    private int status;
    private Date lastChange;
    private String next;
    private String sourceReason;
    private String specialConcern;
    private String parkReason;
    private String passReason;
    private String meetingRecord;
    private String bpRecord;

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

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public int getPartner() {
        return partner;
    }

    public void setPartner(int partner) {
        this.partner = partner;
    }

    public int getManager() {
        return manager;
    }

    public void setManager(int manager) {
        this.manager = manager;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getLastChange() {
        return lastChange;
    }

    public void setLastChange(Date lastChange) {
        this.lastChange = lastChange;
    }

    public String getNext() {
        return next;
    }

    public void setNext(String next) {
        this.next = next;
    }

    public String getSourceReason() {
        return sourceReason;
    }

    public void setSourceReason(String sourceReason) {
        this.sourceReason = sourceReason;
    }

    public String getPassReason() {
        return passReason;
    }

    public void setPassReason(String passReason) {
        this.passReason = passReason;
    }

    public String getMeetingRecord() {
        return meetingRecord;
    }

    public void setMeetingRecord(String meetingRecord) {
        this.meetingRecord = meetingRecord;
    }

    public String getBpRecord() {
        return bpRecord;
    }

    public void setBpRecord(String bpRecord) {
        this.bpRecord = bpRecord;
    }

    public String getRevenue() {
        return revenue;
    }

    public void setRevenue(String revenue) {
        this.revenue = revenue;
    }

    public String getNetIncome() {
        return netIncome;
    }

    public void setNetIncome(String netIncome) {
        this.netIncome = netIncome;
    }

    public String getParkReason() {
        return parkReason;
    }

    public void setParkReason(String parkReason) {
        this.parkReason = parkReason;
    }

    public String getSpecialConcern() {
        return specialConcern;
    }

    public void setSpecialConcern(String specialConcern) {
        this.specialConcern = specialConcern;
    }
}
