package com.ldu.bs.bean;

public class MidClass {
    private Integer midId;

    private String midName;

    private Integer bigId;

    private BigClass bigClass;

    public BigClass getBigClass() {
        return bigClass;
    }

    public void setBigClass(BigClass bigClass) {
        this.bigClass = bigClass;
    }

    public Integer getMidId() {
        return midId;
    }

    public void setMidId(Integer midId) {
        this.midId = midId;
    }

    public String getMidName() {
        return midName;
    }

    public void setMidName(String midName) {
        this.midName = midName == null ? null : midName.trim();
    }

    public Integer getBigId() {
        return bigId;
    }

    public void setBigId(Integer bigId) {
        this.bigId = bigId;
    }
}