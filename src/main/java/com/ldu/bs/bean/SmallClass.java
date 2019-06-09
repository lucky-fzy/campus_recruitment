package com.ldu.bs.bean;

public class SmallClass {
    private Integer smallId;

    private String smallName;

    private Integer ishot;

    private Integer midId;

    private MidClass midClass;


    public MidClass getMidClass() {
        return midClass;
    }

    public void setMidClass(MidClass midClass) {
        this.midClass = midClass;
    }

    public Integer getSmallId() {
        return smallId;
    }

    public void setSmallId(Integer smallId) {
        this.smallId = smallId;
    }

    public String getSmallName() {
        return smallName;
    }

    public void setSmallName(String smallName) {
        this.smallName = smallName == null ? null : smallName.trim();
    }

    public Integer getIshot() {
        return ishot;
    }

    public void setIshot(Integer ishot) {
        this.ishot = ishot;
    }

    public Integer getMidId() {
        return midId;
    }

    public void setMidId(Integer midId) {
        this.midId = midId;
    }
}