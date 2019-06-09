package com.ldu.bs.service;

import com.ldu.bs.bean.*;
import com.ldu.bs.dao.ToudiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ToudiService {
    @Autowired
    ToudiMapper toudiMapper;
    @Autowired
    CompanyService companyService;
    @Autowired
    PositionService positionService;
    @Autowired
    ResumeService resumeService;

    public void addToudi(Toudi toudi) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(" yyyy-MM-dd ");
        String currentDate =   dateFormat.format( new Date() );
        toudi.setToudiType(0);
        toudi.setToudiDate(currentDate);
        toudiMapper.insertSelective(toudi);
    }

    public List<Integer> getResumeId(List<Position> positions) {
        ToudiExample example = new ToudiExample();
        ToudiExample.Criteria criteria = example.createCriteria();
        List<Integer> positionId = new ArrayList<>();
        for (int i = 0;i<positions.size();i++){
            positionId.add(positions.get(i).getPositionId());
        }
        criteria.andPositionIdIn(positionId);
        List<Toudi> toudis = toudiMapper.selectByExample(example);
        List<Integer> resumeId = new ArrayList<>();
        for (int i = 0;i<toudis.size();i++){
            resumeId.add(toudis.get(i).getResumeId());
        }
        return resumeId;
    }

    public List<Toudi> getResumes(int i) {
        ToudiExample example = new ToudiExample();
        ToudiExample.Criteria criteria = example.createCriteria();
        criteria.andToudiTypeEqualTo(i);
        example.setOrderByClause("toudi_date desc");
        return toudiMapper.selectByExampleWithResume(example);
    }

    public void updateInfo(Toudi toudi) {
        toudiMapper.updateByPrimaryKeySelective(toudi);
    }

    public List<Toudi> getToudiInfo(Integer resumeId,Integer type) {
        ToudiExample example = new ToudiExample();
        ToudiExample.Criteria criteria = example.createCriteria();
        if (type == -1){
            criteria.andResumeIdEqualTo(resumeId).andToudiTypeNotEqualTo(4);
        }else {
            criteria.andToudiTypeEqualTo(type).andResumeIdEqualTo(resumeId);
        }
        return toudiMapper.selectByExample(example);
    }

    public List<Toudi> getToudis() {
        ToudiExample example = new ToudiExample();
        example.setOrderByClause("toudi_date desc");
        return toudiMapper.selectByExample(example);
    }

    public List<Toudi> getToudisWithComp(Integer toudiType, String companyName) {
        List<Position> positions = positionService.getPositionWithCompanyName(companyName);
        if (positions.size() == 0){
            return null;
        }else {
            List<Integer> positionId =positions.stream().map(Position::getPositionId).collect(Collectors.toList());
            ToudiExample example = new ToudiExample();
            ToudiExample.Criteria criteria = example.createCriteria();
            if (toudiType == -1){
                criteria.andPositionIdIn(positionId);
            }else {
                criteria.andToudiTypeEqualTo(toudiType).andPositionIdIn(positionId);
            }
            return toudiMapper.selectByExample(example);
        }
    }

    public void delToudi(Integer toudiId) {
        toudiMapper.deleteByPrimaryKey(toudiId);
    }

    public List<Toudi> selectToudi(String degree, Integer positionId, Integer type) {
        ToudiExample example = new ToudiExample();
        ToudiExample.Criteria criteria = example.createCriteria();
        List<Resume> resumes = resumeService.selectResumes(degree);
        if (resumes.size() == 0 && positionId==0){
            criteria.andToudiTypeEqualTo(type);
        }else if (resumes.size() == 0 && positionId !=0){
            criteria.andPositionIdEqualTo(positionId).andToudiTypeEqualTo(type);
        }else if (resumes.size() != 0 && positionId==0){
            List<Integer> resumeIds = resumes.stream().map(Resume::getResumeId).collect(Collectors.toList());
            criteria.andResumeIdIn(resumeIds).andToudiTypeEqualTo(type);
        }else {
            List<Integer> resumeIds = resumes.stream().map(Resume::getResumeId).collect(Collectors.toList());
            criteria.andResumeIdIn(resumeIds).andPositionIdEqualTo(positionId).andToudiTypeEqualTo(type);
        }

        return toudiMapper.selectByExample(example);
    }
}
