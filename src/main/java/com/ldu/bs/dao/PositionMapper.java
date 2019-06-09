package com.ldu.bs.dao;

import com.ldu.bs.bean.Position;
import com.ldu.bs.bean.PositionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PositionMapper {
    long countByExample(PositionExample example);

    int deleteByExample(PositionExample example);

    int deleteByPrimaryKey(Integer positionId);

    int insert(Position record);

    int insertSelective(Position record);

    List<Position> selectByExampleWithBLOBs(PositionExample example);

    List<Position> selectByExample(PositionExample example);

    List<Position> selectByExampleWithComp(PositionExample example);

    List<Position> selectWithCompName(String companyName);

    Position selectByPrimaryKey(Integer positionId);

    int updateByExampleSelective(@Param("record") Position record, @Param("example") PositionExample example);

    int updateByExampleWithBLOBs(@Param("record") Position record, @Param("example") PositionExample example);

    int updateByExample(@Param("record") Position record, @Param("example") PositionExample example);

    int updateByPrimaryKeySelective(Position record);

    int updateByPrimaryKeyWithBLOBs(Position record);

    int updateByPrimaryKey(Position record);
}