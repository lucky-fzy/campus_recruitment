package com.ldu.bs.dao;

import com.ldu.bs.bean.Authentication;
import com.ldu.bs.bean.AuthenticationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AuthenticationMapper {
    long countByExample(AuthenticationExample example);

    int deleteByExample(AuthenticationExample example);

    int deleteByPrimaryKey(Integer authenticationId);

    int insert(Authentication record);

    int insertSelective(Authentication record);

    List<Authentication> selectByExample(AuthenticationExample example);

    Authentication selectByPrimaryKey(Integer authenticationId);

    int updateByExampleSelective(@Param("record") Authentication record, @Param("example") AuthenticationExample example);

    int updateByExample(@Param("record") Authentication record, @Param("example") AuthenticationExample example);

    int updateByPrimaryKeySelective(Authentication record);

    int updateByPrimaryKey(Authentication record);
}