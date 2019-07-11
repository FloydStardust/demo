package com.example.entity;

import java.sql.Date;

/**
 * Description:
 * Created by Floyd on 2019/4/29 12:59
 */
public class LP extends Entity{
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
}
