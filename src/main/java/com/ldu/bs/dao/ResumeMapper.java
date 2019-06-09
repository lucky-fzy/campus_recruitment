package com.ldu.bs.dao;

import com.ldu.bs.bean.Resume;
import com.ldu.bs.bean.ResumeExample;
import com.ldu.bs.bean.ResumeWithBLOBs;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ResumeMapper {
    long countByExample(ResumeExample example);

    int deleteByExample(ResumeExample example);

    int deleteByPrimaryKey(Integer resumeId);

    int insert(ResumeWithBLOBs record);

    int insertSelective(Resume record);

    List<ResumeWithBLOBs> selectByExampleWithBLOBs(ResumeExample example);

    List<Resume> selectByExample(ResumeExample example);

    ResumeWithBLOBs selectByPrimaryKey(Integer resumeId);

    int updateByExampleSelective(@Param("record") ResumeWithBLOBs record, @Param("example") ResumeExample example);

    int updateByExampleWithBLOBs(@Param("record") ResumeWithBLOBs record, @Param("example") ResumeExample example);

    int updateByExample(@Param("record") Resume record, @Param("example") ResumeExample example);

    int updateByPrimaryKeySelective(Resume record);

    int updateByPrimaryKeyWithBLOBs(ResumeWithBLOBs record);

    int updateByPrimaryKey(Resume record);
}