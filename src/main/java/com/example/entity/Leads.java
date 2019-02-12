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
    private String director;
    private String manager;
    private String companyName;
    private String industry;
    private String location;
    private String summary;
    private String description;
    private int status;
    private Date lastChange;
    private int nextStep;
    private String reason;

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public enum Status{
        OBSERVING("继续观察", 0), PASS("PASS", -1),
        SENIOR("见过高管",1), FOUNDER("见过创始人", 2), MEETING("上过周会", 3),
        TS("TS", 4), DD("DD", 5), IC("IC", 6), INVESTED("已投", 7);

        private String name;
        private int index;

        private Status(String name, int index){
            this.name = name;
            this.index  =index;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }
    }

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

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
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

    public int getNextStep() {
        return nextStep;
    }

    public void setNextStep(int nextStep) {
        this.nextStep = nextStep;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

//    public Enum Status{
//
//    }
}
