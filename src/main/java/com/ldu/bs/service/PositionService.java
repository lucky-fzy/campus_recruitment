package com.ldu.bs.service;

import com.ldu.bs.bean.Company;
import com.ldu.bs.bean.CompanyExample;
import com.ldu.bs.bean.Position;
import com.ldu.bs.bean.PositionExample;
import com.ldu.bs.dao.CompanyMapper;
import com.ldu.bs.dao.PositionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PositionService {
    @Autowired
    PositionMapper positionMapper;
    @Autowired
    CompanyMapper companyMapper;
    @Autowired
    CompanyService companyService;

    public List<Position> getAll(){
        PositionExample example = new PositionExample();
        example.setOrderByClause("release_time desc");
        return positionMapper.selectByExampleWithComp(example);
    }

    public List<Position> getPositionWithName(String value) {
        PositionExample example = new PositionExample();
        PositionExample.Criteria criteria = example.createCriteria();
        criteria.andPositionNameLike("%"+value+"%");
        example.setOrderByClause("release_time desc");
        return positionMapper.selectByExampleWithComp(example);
    }

    public Position getJobDetail(Integer positionId) {
        PositionExample example = new PositionExample();
        PositionExample.Criteria criteria = example.createCriteria();
        criteria.andPositionIdEqualTo(positionId);

        return positionMapper.selectByExampleWithComp(example).get(0);
    }

    public void addPosition(Position position) {
        positionMapper.insertSelective(position);
    }

    public List<Position> getPositionWithCom(Integer companyId) {
        PositionExample example = new PositionExample();
        example.setOrderByClause("release_time desc");
        PositionExample.Criteria criteria = example.createCriteria();
        criteria.andCompanyIdEqualTo(companyId);
        return positionMapper.selectByExample(example);

    }

    public void updataIsOnline(Position position) {
        positionMapper.updateByPrimaryKeySelective(position);
    }

    public void deletePosition(Integer positionId) {
        positionMapper.deleteByPrimaryKey(positionId);
    }

    public Position getPosition(Integer positionId) {
        return positionMapper.selectByPrimaryKey(positionId);
    }

    public void updatePosition(Position position) {
        positionMapper.updateByPrimaryKeySelective(position);
    }

    public List<Position> searchPositions(String searchName, String searchVal) {
        if (searchName.equals("companyName")){
            return positionMapper.selectWithCompName(searchVal);
        }else if (searchName.equals("midName")) {
            PositionExample example = new PositionExample();
            PositionExample.Criteria criteria = example.createCriteria();
            criteria.andPositionTypeEqualTo(searchVal);
            example.setOrderByClause("release_time desc");
            return positionMapper.selectByExample(example);
        }else{
            PositionExample example = new PositionExample();
            PositionExample.Criteria criteria = example.createCriteria();
            example.setOrderByClause("release_time desc");
            criteria.andPositionNameLike("%"+searchVal+"%");
            return positionMapper.selectByExample(example);
        }
    }

    public List<Position> selectPositions(String type, String value) {
        PositionExample example = new PositionExample();
        PositionExample.Criteria criteria = example.createCriteria();
        if (type.equals("city") && !value.equals("全国")){
            criteria.andJobCityLike("%"+value+"%");
        }else if(type.equals("city") && value.equals("全国")){
            return positionMapper.selectByExampleWithComp(null);
        }
        return positionMapper.selectByExampleWithComp(example);
    }

    public List<Position> getPositions(List<Integer> positionIds) {
        PositionExample example = new PositionExample();
        PositionExample.Criteria criteria = example.createCriteria();
        criteria.andPositionIdIn(positionIds);
        example.setOrderByClause("release_time desc");
        return positionMapper.selectByExampleWithComp(example);
    }

    public List<Position> onlinePosition(Integer companyId) {
        PositionExample example = new PositionExample();
        PositionExample.Criteria criteria = example.createCriteria();
        criteria.andCompanyIdEqualTo(companyId).andIsOnlineEqualTo("1");
        example.setOrderByClause("release_time desc");
        return positionMapper.selectByExample(example);
    }

    public List<Position> selectPositionsWithMore(String city, String salary, String job_experience, String degree, String jobType) {
        String[] salarys = salary.split("-");
        int minSalary = Integer.parseInt(salarys[0]);
        int maxSalary = Integer.parseInt(salarys[1]);
        if (job_experience.equals("不限")){
            job_experience = "";
        }
        if (degree.equals("不限")){
            degree = "";
        }
        PositionExample example = new PositionExample();
        example.setOrderByClause("release_time desc");
        PositionExample.Criteria criteria = example.createCriteria();
        if (city.equals("全国")){
            criteria.andMinSalaryGreaterThanOrEqualTo(minSalary)
                    .andMinSalaryLessThanOrEqualTo(maxSalary)
                    .andJobExperienceLike("%"+job_experience+"%")
                    .andDegreeLike("%"+degree+"%")
                    .andJobTypeLike("%"+jobType+"%");
        }else if (!city.equals("全国")){
            criteria.andJobCityEqualTo(city)
                    .andMinSalaryGreaterThanOrEqualTo(minSalary)
                    .andMinSalaryLessThanOrEqualTo(maxSalary)
                    .andJobExperienceLike("%"+job_experience+"%")
                    .andDegreeLike("%"+degree+"%")
                    .andJobTypeLike("%"+jobType+"%");
        }
        return positionMapper.selectByExampleWithComp(example);
    }

    public List<Position> getPositionWithCompanyName(String companyName) {
        List<Company> companies = companyService.searchComp(companyName);
        if (companies.size() == 0){
            return null;
        }else{
            List<Integer> companysId =companies.stream().map(Company::getCompanyId).collect(Collectors.toList());
            PositionExample positionExample = new PositionExample();
            PositionExample.Criteria positionCriteria = positionExample.createCriteria();
            positionCriteria.andCompanyIdIn(companysId);
            return positionMapper.selectByExample(positionExample);
        }
    }

    public List<Position> getFullTime() {
        PositionExample example = new PositionExample();
        PositionExample.Criteria criteria = example.createCriteria();
        criteria.andJobTypeEqualTo("全职");
        return positionMapper.selectByExampleWithComp(example).subList(0,5);
    }

    public List<Position> getPartTime() {
        PositionExample example = new PositionExample();
        PositionExample.Criteria criteria = example.createCriteria();
        criteria.andJobTypeEqualTo("实习");
        return positionMapper.selectByExampleWithComp(example).subList(0,5);
    }
}
