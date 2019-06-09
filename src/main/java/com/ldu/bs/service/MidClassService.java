package com.ldu.bs.service;

import com.ldu.bs.bean.MidClass;
import com.ldu.bs.bean.MidClassExample;
import com.ldu.bs.dao.MidClassMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MidClassService {

    @Autowired
    MidClassMapper midClassMapper;

    /*
     *查询职位的中类
     * */
    public List<MidClass> getAll(){
        return midClassMapper.selectByExample(null);
    }

    public MidClass selectWithBig(Integer midId) {
        return midClassMapper.selectWithBig(midId);
    }

    public List<MidClass> selectMidClass(Integer bigId) {
        MidClassExample example = new MidClassExample();
        MidClassExample.Criteria criteria = example.createCriteria();
        criteria.andBigIdEqualTo(bigId);
        return midClassMapper.selectByExample(example);
    }
}
