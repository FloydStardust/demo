package com.example.vo;

import com.example.entity.LP;

import java.sql.Date;

/**
 * Description:
 * Created by Floyd on 2019/4/29 15:03
 */
public class LPVo {
    private int uid;
    private String name;
    private String fullName;
    private String base;
    private String kp;
    private String kpTel;
    private String kpEmail;
    private String connector;
    private String connectorTel;
    private String connectorEmail;
    private String importance;
    private Date lastMeetDate;
    private String lastMeetUser;

    public LPVo(){

    }

    public LPVo(LP lp){
        this.uid = lp.getUid();
        this.name = lp.getName();
        this.fullName = lp.getFullName();
        this.base = lp.getBase();
        this.kp = lp.getKp();
        this.kpTel = lp.getKpTel();
        this.kpEmail = lp.getKpEmail();
        this.connector = lp.getConnector();
        this.connectorTel = lp.getConnectorTel();
        this.connectorEmail = lp.getConnectorEmail();
        this.importance = lp.getImportance();
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getBase() {
        return base;
    }

    public void setBase(String base) {
        this.base = base;
    }

    public String getKp() {
        return kp;
    }

    public void setKp(String kp) {
        this.kp = kp;
    }

    public String getKpTel() {
        return kpTel;
    }

    public void setKpTel(String kpTel) {
        this.kpTel = kpTel;
    }

    public String getKpEmail() {
        return kpEmail;
    }

    public void setKpEmail(String kpEmail) {
        this.kpEmail = kpEmail;
    }

    public String getConnector() {
        return connector;
    }

    public void setConnector(String connector) {
        this.connector = connector;
    }

    public String getConnectorTel() {
        return connectorTel;
    }

    public void setConnectorTel(String connectorTel) {
        this.connectorTel = connectorTel;
    }

    public String getConnectorEmail() {
        return connectorEmail;
    }

    public void setConnectorEmail(String connectorEmail) {
        this.connectorEmail = connectorEmail;
    }

    public String getImportance() {
        return importance;
    }

    public void setImportance(String importance) {
        this.importance = importance;
    }

    public String getLastMeetUser() {
        return lastMeetUser;
    }

    public void setLastMeetUser(String lastMeetUser) {
        this.lastMeetUser = lastMeetUser;
    }

    public Date getLastMeetDate() {
        return lastMeetDate;
    }

    public void setLastMeetDate(Date lastMeetDate) {
        this.lastMeetDate = lastMeetDate;
    }
}
