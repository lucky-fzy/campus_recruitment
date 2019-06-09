package com.ldu.bs.service;

import com.ldu.bs.bean.SmallClass;
import com.ldu.bs.bean.SmallClassExample;
import com.ldu.bs.dao.SmallClassMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SmallClassService {

    @Autowired
    SmallClassMapper smallClassMapper;

    /*
     *查询职位的小类
     * */
    public List<SmallClass> getAll(){
        return smallClassMapper.selectByExample(null);
    }

    public List<SmallClass> selectWithMid() {
        return smallClassMapper.selectWithMid(null);
    }

    public void updateHot(SmallClass smallClass) {
        smallClassMapper.updateByPrimaryKeySelective(smallClass);
    }

    public void delClass(Integer smallId) {
        smallClassMapper.deleteByPrimaryKey(smallId);
    }

    public void addSmallClass(SmallClass smallClass) {
        smallClass.setIshot(0);
        smallClassMapper.insertSelective(smallClass);
    }

    public SmallClass selectClass(Integer smallId) {
        return smallClassMapper.selectByPrimaryKey(smallId);
    }

    public void updateClass(SmallClass smallClass) {
        smallClassMapper.updateByPrimaryKeySelective(smallClass);
    }

    public List<SmallClass> selectHot() {
        SmallClassExample example = new SmallClassExample();
        SmallClassExample.Criteria criteria = example.createCriteria();
        criteria.andIshotEqualTo(1);
        return smallClassMapper.selectByExample(example).subList(0,10);
    }
}
