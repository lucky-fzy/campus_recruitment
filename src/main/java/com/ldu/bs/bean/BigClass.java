package com.ldu.bs.bean;

public class BigClass {
    private Integer bigId;

    private String bigName;

    public Integer getBigId() {
        return bigId;
    }

    public void setBigId(Integer bigId) {
        this.bigId = bigId;
    }

    public String getBigName() {
        return bigName;
    }

    public void setBigName(String bigName) {
        this.bigName = bigName == null ? null : bigName.trim();
    }
}