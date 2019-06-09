package com.ldu.bs.bean;

public class Position {
    private Integer positionId;

    private String positionType;

    private String positionName;

    private String department;

    private String jobType;

    private Integer minSalary;

    private Integer maxSalary;

    private String jobCity;

    private String jobExperience;

    private String degree;

    private String positionTemptation;

    private String positionRequirement;

    private String jobAddr;

    private Integer companyId;

    private String releaseTime;

    private String isOnline;

    private String positionDescribe;

    private Company company;

    @Override
    public String toString() {
        return "Position{" +
                "positionId=" + positionId +
                ", positionType='" + positionType + '\'' +
                ", positionName='" + positionName + '\'' +
                ", department='" + department + '\'' +
                ", jobType='" + jobType + '\'' +
                ", minSalary=" + minSalary +
                ", maxSalary=" + maxSalary +
                ", jobCity='" + jobCity + '\'' +
                ", jobExperience='" + jobExperience + '\'' +
                ", degree='" + degree + '\'' +
                ", positionTemptation='" + positionTemptation + '\'' +
                ", positionRequirement='" + positionRequirement + '\'' +
                ", jobAddr='" + jobAddr + '\'' +
                ", companyId=" + companyId +
                ", releaseTime='" + releaseTime + '\'' +
                ", isOnline='" + isOnline + '\'' +
                ", positionDescribe='" + positionDescribe + '\'' +
                ", company=" + company +
                '}';
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public String getPositionType() {
        return positionType;
    }

    public void setPositionType(String positionType) {
        this.positionType = positionType == null ? null : positionType.trim();
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName == null ? null : positionName.trim();
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department == null ? null : department.trim();
    }

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType == null ? null : jobType.trim();
    }

    public Integer getMinSalary() {
        return minSalary;
    }

    public void setMinSalary(Integer minSalary) {
        this.minSalary = minSalary;
    }

    public Integer getMaxSalary() {
        return maxSalary;
    }

    public void setMaxSalary(Integer maxSalary) {
        this.maxSalary = maxSalary;
    }

    public String getJobCity() {
        return jobCity;
    }

    public void setJobCity(String jobCity) {
        this.jobCity = jobCity == null ? null : jobCity.trim();
    }

    public String getJobExperience() {
        return jobExperience;
    }

    public void setJobExperience(String jobExperience) {
        this.jobExperience = jobExperience == null ? null : jobExperience.trim();
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree == null ? null : degree.trim();
    }

    public String getPositionTemptation() {
        return positionTemptation;
    }

    public void setPositionTemptation(String positionTemptation) {
        this.positionTemptation = positionTemptation == null ? null : positionTemptation.trim();
    }

    public String getPositionRequirement() {
        return positionRequirement;
    }

    public void setPositionRequirement(String positionRequirement) {
        this.positionRequirement = positionRequirement == null ? null : positionRequirement.trim();
    }

    public String getJobAddr() {
        return jobAddr;
    }

    public void setJobAddr(String jobAddr) {
        this.jobAddr = jobAddr == null ? null : jobAddr.trim();
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime == null ? null : releaseTime.trim();
    }

    public String getIsOnline() {
        return isOnline;
    }

    public void setIsOnline(String isOnline) {
        this.isOnline = isOnline == null ? null : isOnline.trim();
    }

    public String getPositionDescribe() {
        return positionDescribe;
    }

    public void setPositionDescribe(String positionDescribe) {
        this.positionDescribe = positionDescribe == null ? null : positionDescribe.trim();
    }
}