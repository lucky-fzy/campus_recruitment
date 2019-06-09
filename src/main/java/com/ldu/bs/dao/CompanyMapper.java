package com.ldu.bs.dao;

import com.ldu.bs.bean.Company;
import com.ldu.bs.bean.CompanyExample;
import java.util.List;

import com.ldu.bs.bean.Position;
import org.apache.ibatis.annotations.Param;

public interface CompanyMapper {
    long countByExample(CompanyExample example);

    int deleteByExample(CompanyExample example);

    int deleteByPrimaryKey(Integer companyId);

    int insert(Company record);

    int insertSelective(Company record);

    List<Company> selectByExampleWithBLOBs(CompanyExample example);
    List<Position> selectByExampleWithPos(String value);
    List<Company> selectByExample(CompanyExample example);

    List<Position> selectByExampleWithPosition(Integer companyId);

    Company selectByPrimaryKey(Integer companyId);

    int updateByExampleSelective(@Param("record") Company record, @Param("example") CompanyExample example);

    int updateByExampleWithBLOBs(@Param("record") Company record, @Param("example") CompanyExample example);

    int updateByExample(@Param("record") Company record, @Param("example") CompanyExample example);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKeyWithBLOBs(Company record);

    int updateByPrimaryKey(Company record);
}