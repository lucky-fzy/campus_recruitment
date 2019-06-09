package com.ldu.bs.bean;

public class ResumeWithBLOBs extends Resume {
    private String jobdescribe;

    private String selfdescribe;

    public String getJobdescribe() {
        return jobdescribe;
    }

    public void setJobdescribe(String jobdescribe) {
        this.jobdescribe = jobdescribe == null ? null : jobdescribe.trim();
    }

    public String getSelfdescribe() {
        return selfdescribe;
    }

    public void setSelfdescribe(String selfdescribe) {
        this.selfdescribe = selfdescribe == null ? null : selfdescribe.trim();
    }
}