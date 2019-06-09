package com.ldu.bs.service;

import com.ldu.bs.bean.Emp;
import com.ldu.bs.bean.EmpExample;
import com.ldu.bs.dao.EmpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class EmpService {

    @Autowired
    EmpMapper empMapper;

    public List<Emp> getUser(String email) {
        EmpExample example = new EmpExample();
        EmpExample.Criteria criteria = example.createCriteria();
        criteria.andEmailEqualTo(email);
        return empMapper.selectByExample(example);
    }

    public boolean checkEmail(String email) {
        EmpExample example = new EmpExample();
        EmpExample.Criteria criteria = example.createCriteria();
        criteria.andEmailEqualTo(email);

        long count = empMapper.countByExample(example);
        return count==0;
    }

    public void addEmp(String email, String password) {
        Emp emp = new Emp();
        emp.setPwd(password);
        emp.setEmail(email);
        emp.setEmpName("");
        emp.setGender("");
        emp.setNickname("");
        emp.setSchool("");
        empMapper.insertSelective(emp);
    }

    public void updateInfo(Emp emp) {
        empMapper.updateByPrimaryKeySelective(emp);

    }

    public Emp getEmp(Integer empId) {
        return empMapper.selectByPrimaryKey(empId);
    }

    public List<Emp> getAllEmp() {
        return empMapper.selectByExample(null);
    }

    public void createEmp(Emp emp) {
        empMapper.insertSelective(emp);
    }

    public void deleteEmp(Integer empId) {
        empMapper.deleteByPrimaryKey(empId);
    }

    public List<Emp> searchEmp(String searchName, String searchVal) {
        EmpExample example = new EmpExample();
        EmpExample.Criteria criteria = example.createCriteria();
        if (searchName.equals("nickname")){
            criteria.andNicknameLike("%"+searchVal+"%");
        }else if (searchName.equals("emp_name")){
            criteria.andEmpNameLike("%"+searchVal+"%");
        }else {
            criteria.andSchoolLike("%"+searchVal+"%");
        }
        return empMapper.selectByExample(example);
    }

    public List<Emp> getEmpWithName(String empName) {
        if (empName.equals("")){
            return empMapper.selectByExample(null);
        }
        EmpExample example = new EmpExample();
        EmpExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameLike("%"+empName+"%");
        return empMapper.selectByExample(example);
    }
}
