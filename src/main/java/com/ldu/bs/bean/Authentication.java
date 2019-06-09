package com.ldu.bs.bean;

public class Authentication {
    private Integer authenticationId;

    private Integer companyId;

    private String license;

    private String authDate;

    private String isauth;

    private Company company;


    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Integer getAuthenticationId() {
        return authenticationId;
    }

    public void setAuthenticationId(Integer authenticationId) {
        this.authenticationId = authenticationId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license == null ? null : license.trim();
    }

    public String getAuthDate() {
        return authDate;
    }

    public void setAuthDate(String authDate) {
        this.authDate = authDate == null ? null : authDate.trim();
    }

    public String getIsauth() {
        return isauth;
    }

    public void setIsauth(String isauth) {
        this.isauth = isauth == null ? null : isauth.trim();
    }
}