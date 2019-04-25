package com.example.entity;

/**
 * Description:
 * Created by Floyd on 2019/4/22 18:17
 */
public class Vendor extends Entity {
    private int uid;
    private int project;
    private int type;
    private String name;
    private String partner;
    private String partnerContact;
    private String conductor;
    private String conductorContact;
    private String businessType;
    private String charge;
    private String costBearer;
    private String comment;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    public String getCharge() {
        return charge;
    }

    public void setCharge(String charge) {
        this.charge = charge;
    }

    public String getCostBearer() {
        return costBearer;
    }

    public void setCostBearer(String costBearer) {
        this.costBearer = costBearer;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }


    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPartner() {
        return partner;
    }

    public void setPartner(String partner) {
        this.partner = partner;
    }

    public String getPartnerContact() {
        return partnerContact;
    }

    public void setPartnerContact(String partnerContact) {
        this.partnerContact = partnerContact;
    }

    public String getConductor() {
        return conductor;
    }

    public void setConductor(String conductor) {
        this.conductor = conductor;
    }

    public String getConductorContact() {
        return conductorContact;
    }

    public void setConductorContact(String conductorContact) {
        this.conductorContact = conductorContact;
    }

    public int getProject() {
        return project;
    }

    public void setProject(int project) {
        this.project = project;
    }
}
