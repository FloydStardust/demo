package com.example.entity;

import java.sql.Date;

/**
 * Description:
 * Created by Floyd on 2019/4/29 11:57
 */
public class LPMeetingRecords extends Entity {
    private int uid;
    private int lpId;
    private String user;
    private Date date;
    private String person;
    private String content;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getLpId() {
        return lpId;
    }

    public void setLpId(int lpId) {
        this.lpId = lpId;
    }
}
