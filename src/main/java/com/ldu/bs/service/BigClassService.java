package com.ldu.bs.service;

import com.ldu.bs.bean.BigClass;
import com.ldu.bs.dao.BigClassMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BigClassService {

    @Autowired
    BigClassMapper bigClassMapper;

    /*
    *查询职位的大类
    * */
    public List<BigClass> getAll(){
        return bigClassMapper.selectByExample(null);
    }
}
