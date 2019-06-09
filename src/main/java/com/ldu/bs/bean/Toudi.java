package com.ldu.bs.bean;

public class Toudi {
    private Integer toudiId;

    private Integer positionId;

    private Integer resumeId;

    private String toudiDate;

    private Integer toudiType;

    private Resume resume;

    private Position position;

    private String Type;

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Resume getResume() {
        return resume;
    }

    public void setResume(Resume resume) {
        this.resume = resume;
    }

    public Integer getToudiId() {
        return toudiId;
    }

    public void setToudiId(Integer toudiId) {
        this.toudiId = toudiId;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public Integer getResumeId() {
        return resumeId;
    }

    public void setResumeId(Integer resumeId) {
        this.resumeId = resumeId;
    }

    public String getToudiDate() {
        return toudiDate;
    }

    public void setToudiDate(String toudiDate) {
        this.toudiDate = toudiDate == null ? null : toudiDate.trim();
    }

    public Integer getToudiType() {
        return toudiType;
    }

    public void setToudiType(Integer toudiType) {
        this.toudiType = toudiType;
    }
}