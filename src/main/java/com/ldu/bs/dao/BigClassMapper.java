package com.ldu.bs.dao;

import com.ldu.bs.bean.BigClass;
import com.ldu.bs.bean.BigClassExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BigClassMapper {
    long countByExample(BigClassExample example);

    int deleteByExample(BigClassExample example);

    int deleteByPrimaryKey(Integer bigId);

    int insert(BigClass record);

    int insertSelective(BigClass record);

    List<BigClass> selectByExample(BigClassExample example);

    BigClass selectByPrimaryKey(Integer bigId);

    int updateByExampleSelective(@Param("record") BigClass record, @Param("example") BigClassExample example);

    int updateByExample(@Param("record") BigClass record, @Param("example") BigClassExample example);

    int updateByPrimaryKeySelective(BigClass record);

    int updateByPrimaryKey(BigClass record);
}