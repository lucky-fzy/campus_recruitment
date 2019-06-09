package com.ldu.bs.dao;

import com.ldu.bs.bean.MidClass;
import com.ldu.bs.bean.MidClassExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MidClassMapper {
    long countByExample(MidClassExample example);

    int deleteByExample(MidClassExample example);

    int deleteByPrimaryKey(Integer midId);

    int insert(MidClass record);

    int insertSelective(MidClass record);

    List<MidClass> selectByExample(MidClassExample example);

    MidClass selectWithBig(Integer midId);

    MidClass selectByPrimaryKey(Integer midId);

    int updateByExampleSelective(@Param("record") MidClass record, @Param("example") MidClassExample example);

    int updateByExample(@Param("record") MidClass record, @Param("example") MidClassExample example);

    int updateByPrimaryKeySelective(MidClass record);

    int updateByPrimaryKey(MidClass record);
}