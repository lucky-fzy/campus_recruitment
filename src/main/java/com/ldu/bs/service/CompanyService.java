package com.ldu.bs.service;

import com.ldu.bs.bean.Company;
import com.ldu.bs.bean.CompanyExample;
import com.ldu.bs.bean.Position;
import com.ldu.bs.dao.CompanyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyService {
    @Autowired
    CompanyMapper companyMapper;

    public List<Company> getCompany(String email) {
        CompanyExample example = new CompanyExample();
        CompanyExample.Criteria criteria = example.createCriteria();
        criteria.andCompanyEmailEqualTo(email);

        return companyMapper.selectByExample(example);
    }

    public boolean checkEmail(String email) {
        CompanyExample example = new CompanyExample();
        CompanyExample.Criteria criteria = example.createCriteria();
        criteria.andCompanyEmailEqualTo(email);

        long count = companyMapper.countByExample(example);
        return count==0;
    }

    public void addComp(String email, String password) {
        Company company = new Company();
        company.setCompanyName("");
        company.setCompanyCity("");
        company.setCompanyPwd(password);
        company.setCompanyEmail(email);
        company.setCompanyLogo("");
        company.setCompanyPhone("");
        company.setCompanyWebsite("");
        company.setCompanyPosition("");
        company.setIsAuthentication("0");
        company.setField("");
        company.setScale("");
        company.setStage("");
        company.setReceiveEmail("");
        companyMapper.insertSelective(company);
    }

    public List<Position> getPositionWithComp(String value) {

        return companyMapper.selectByExampleWithPos(value);
    }

    public List<Company> getAllCompany() {
        return companyMapper.selectByExample(null);
    }

    public List<Company> getCompanys(String city, String stage,String field) {
        CompanyExample example = new CompanyExample();
        CompanyExample.Criteria criteria = example.createCriteria();
        if (city.equals("全国")){
            criteria.andStageLike("%"+stage+"%").andFieldLike("%"+field+"%");
        }else {
            criteria.andCompanyCityEqualTo(city).andStageLike("%"+stage+"%").andFieldLike("%"+field+"%");
        }
        return companyMapper.selectByExample(example);
    }

    public Company getCompanyDetail(Integer companyId) {
        return companyMapper.selectByPrimaryKey(companyId);
    }

    public List<Position> getPositions(Integer companyId) {
        return companyMapper.selectByExampleWithPosition(companyId);
    }

    public void updateCompanyInfo(Company company) {
        companyMapper.updateByPrimaryKeySelective(company);
    }

    public void delComp(Integer companyId) {
        companyMapper.deleteByPrimaryKey(companyId);
    }

    public List<Company> searchComp(String searchVal) {
        CompanyExample example = new CompanyExample();
        CompanyExample.Criteria criteria = example.createCriteria();
        criteria.andCompanyNameLike("%"+searchVal+"%");
        return companyMapper.selectByExample(example);
    }

    public void createComp(Company company) {
        companyMapper.insertSelective(company);
    }
}
