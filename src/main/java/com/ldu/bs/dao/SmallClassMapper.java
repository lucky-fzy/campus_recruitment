package com.ldu.bs.dao;

import com.ldu.bs.bean.SmallClass;
import com.ldu.bs.bean.SmallClassExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SmallClassMapper {
    long countByExample(SmallClassExample example);

    int deleteByExample(SmallClassExample example);

    int deleteByPrimaryKey(Integer smallId);

    int insert(SmallClass record);

    int insertSelective(SmallClass record);

    List<SmallClass> selectWithMid(SmallClassExample example);

    List<SmallClass> selectByExample(SmallClassExample example);

    SmallClass selectByPrimaryKey(Integer smallId);

    int updateByExampleSelective(@Param("record") SmallClass record, @Param("example") SmallClassExample example);

    int updateByExample(@Param("record") SmallClass record, @Param("example") SmallClassExample example);

    int updateByPrimaryKeySelective(SmallClass record);

    int updateByPrimaryKey(SmallClass record);
}