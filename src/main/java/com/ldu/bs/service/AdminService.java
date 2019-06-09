package com.ldu.bs.service;

import com.ldu.bs.bean.Admin;
import com.ldu.bs.bean.AdminExample;
import com.ldu.bs.dao.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    @Autowired
    AdminMapper adminMapper;

    public Admin getAdmin(String adminName, String adminPwd) {
        AdminExample example = new AdminExample();
        AdminExample.Criteria criteria = example.createCriteria();
        criteria.andAdminNameEqualTo(adminName).andAdminPwdEqualTo(adminPwd);
        return adminMapper.selectByExample(example).get(0);
    }

    public Boolean check(String adminName, String adminPwd) {
        AdminExample example = new AdminExample();
        AdminExample.Criteria criteria = example.createCriteria();
        criteria.andAdminNameEqualTo(adminName).andAdminPwdEqualTo(adminPwd);
        return adminMapper.selectByExample(example).isEmpty();
    }
}
