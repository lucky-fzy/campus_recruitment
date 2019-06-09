package com.ldu.bs.service;

import com.ldu.bs.bean.Emp;
import com.ldu.bs.bean.Resume;
import com.ldu.bs.bean.ResumeExample;
import com.ldu.bs.dao.ResumeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResumeService {

    @Autowired
    ResumeMapper resumeMapper;

    public void updateResume(Resume resume) {
        resumeMapper.updateByPrimaryKeySelective(resume);
    }


    public boolean checkResume(Integer empId) {
        ResumeExample example = new ResumeExample();
        ResumeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdEqualTo(empId);
        long count = resumeMapper.countByExample(example);
        return count==0;
    }

    public void addResume(Integer empId) {
        Resume resume = new Resume();
        resume.setEmpId(empId);
        resume.setPhoto("default_headpic.png");
        resumeMapper.insertSelective(resume);
    }

    public Resume getReceivedResume(Integer resumeId) {
        return resumeMapper.selectByPrimaryKey(resumeId);
    }

    public List<Resume> getAllResume() {
        return resumeMapper.selectByExample(null);
    }

    public void clearResume(Integer resumeId) {
        Resume resume = resumeMapper.selectByPrimaryKey(resumeId);
        resume.setPhone("");
        resume.setDegree("");
        resume.setCity("");
        resume.setStarttime("");
        resume.setEndtime("");
        resume.setJobtype("");
        resume.setJobdescribe("");
        resume.setMajor("");
        resume.setPhoto("default_headpic.png");
        resume.setPosition("");
        resume.setPost("");
        resume.setProject("");
        resume.setResumeName("");
        resume.setSalary("");
        resume.setSelfdescribe("");
        resume.setStartStu("");
        resume.setEndStu("");
        resumeMapper.updateByPrimaryKeySelective(resume);
    }

    public void addNewResume(Resume resume) {
        resume.setResumeId(null);
        resumeMapper.insertSelective(resume);
    }

    public Resume getResume(Integer empId) {
        ResumeExample example = new ResumeExample();
        ResumeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdEqualTo(empId);
        List<Resume> resumes = resumeMapper.selectByExample(example);
        return resumes.get(resumes.size()-1);
    }

    public List<Resume> selectResumes(String degree) {
        ResumeExample example = new ResumeExample();
        ResumeExample.Criteria criteria = example.createCriteria();
        criteria.andDegreeLike("%"+degree+"%");
        return resumeMapper.selectByExample(example);
    }
}
