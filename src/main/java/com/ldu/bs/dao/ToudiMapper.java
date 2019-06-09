package com.ldu.bs.dao;

import com.ldu.bs.bean.Toudi;
import com.ldu.bs.bean.ToudiExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ToudiMapper {
    long countByExample(ToudiExample example);

    int deleteByExample(ToudiExample example);

    int deleteByPrimaryKey(Integer toudiId);

    int insert(Toudi record);

    int insertSelective(Toudi record);

    List<Toudi> selectByExample(ToudiExample example);

    Toudi selectByPrimaryKey(Integer toudiId);

    int updateByExampleSelective(@Param("record") Toudi record, @Param("example") ToudiExample example);

    int updateByExample(@Param("record") Toudi record, @Param("example") ToudiExample example);

    int updateByPrimaryKeySelective(Toudi record);

    int updateByPrimaryKey(Toudi record);

    List<Toudi> selectByExampleWithResume(ToudiExample example);
}