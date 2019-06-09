package com.ldu.bs.bean;

public class Ad {
    private Integer adId;

    private String adImg;

    private String adName;

    private String adDescribe;

    private String adSite;

    private String isOnline;

    public Integer getAdId() {
        return adId;
    }

    public void setAdId(Integer adId) {
        this.adId = adId;
    }

    public String getAdImg() {
        return adImg;
    }

    public void setAdImg(String adImg) {
        this.adImg = adImg == null ? null : adImg.trim();
    }

    public String getAdName() {
        return adName;
    }

    public void setAdName(String adName) {
        this.adName = adName == null ? null : adName.trim();
    }

    public String getAdDescribe() {
        return adDescribe;
    }

    public void setAdDescribe(String adDescribe) {
        this.adDescribe = adDescribe == null ? null : adDescribe.trim();
    }

    public String getAdSite() {
        return adSite;
    }

    public void setAdSite(String adSite) {
        this.adSite = adSite == null ? null : adSite.trim();
    }

    public String getIsOnline() {
        return isOnline;
    }

    public void setIsOnline(String isOnline) {
        this.isOnline = isOnline == null ? null : isOnline.trim();
    }
}