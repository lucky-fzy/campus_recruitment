package com.ldu.bs.service;

import com.ldu.bs.bean.Collect;
import com.ldu.bs.bean.CollectExample;
import com.ldu.bs.bean.Emp;
import com.ldu.bs.bean.Position;
import com.ldu.bs.dao.CollectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CollectService {

    @Autowired
    CollectMapper collectMapper;
    @Autowired
    EmpService empService;
    @Autowired
    PositionService positionService;

    public void addCollection(Collect collect) {
        collectMapper.insertSelective(collect);
    }

    public Collect selectCollection(Integer positionId, int empId) {

        return collectMapper.selectWithPidAndEid(positionId,empId);
    }

    public void delCollection(Collect collect) {
        collectMapper.deleteByPrimaryKey(selectCollection(collect.getPositionId(),collect.getEmpId()).getCollectId());
    }

    public List<Collect> selectColletWithEmp(Integer empId) {
        CollectExample example = new CollectExample();
        CollectExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdEqualTo(empId);
        return collectMapper.selectByExample(example);
    }

    public List<Collect> getAllCollection() {
        return collectMapper.selectByExample(null);
    }

    public void adminDelCollection(Integer collectId) {
        collectMapper.deleteByPrimaryKey(collectId);
    }

    public List<Collect> getCollectionWithCondition(String searchVal) {
        List<Emp> emps = empService.getEmpWithName(searchVal);
        List<Collect> collects = new ArrayList<>();
        List<Collect> collects1 = new ArrayList<>();

        if (emps.size() != 0){
            List<Integer> empIds = emps.stream().map(Emp::getEmpId).collect(Collectors.toList());
            CollectExample empExample = new CollectExample();
            CollectExample.Criteria empCriteria = empExample.createCriteria();
            empCriteria.andEmpIdIn(empIds);
            collects = collectMapper.selectByExample(empExample);
        }


        List<Position> positions = positionService.getPositionWithName(searchVal);
        if (positions.size() != 0){
            List<Integer> positionIds = positions.stream().map(Position::getPositionId).collect(Collectors.toList());
            CollectExample positionExample = new CollectExample();
            CollectExample.Criteria positionCriteria = positionExample.createCriteria();
            positionCriteria.andPositionIdIn(positionIds);
            collects1 = collectMapper.selectByExample(positionExample);
        }
        collects.addAll(collects1);
        return collects;
    }
}
