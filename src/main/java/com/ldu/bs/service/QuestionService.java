package com.ldu.bs.service;

import com.ldu.bs.bean.Question;
import com.ldu.bs.bean.QuestionExample;
import com.ldu.bs.dao.QuestionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionService {
    @Autowired
    QuestionMapper questionMapper;

    public List<Question> getAllQuestion() {
        QuestionExample example = new QuestionExample();
        example.setOrderByClause("question_date desc");
        return questionMapper.selectByExample(example);
    }

    public List<Question> getQuestion(Integer empId) {
        QuestionExample example = new QuestionExample();
        example.setOrderByClause("question_date desc");
        QuestionExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdEqualTo(empId);
        return questionMapper.selectByExample(example);
    }

    public void addQuestion(Question question) {
        questionMapper.insertSelective(question);
    }

    public Question getQuestionWithId(Integer questionId) {
        return questionMapper.selectByPrimaryKey(questionId);
    }

    public void updateQuestion(Question question) {
        questionMapper.updateByPrimaryKeySelective(question);
    }

    public void questionDel(Integer questionId) {
        questionMapper.deleteByPrimaryKey(questionId);
    }

    public List<Question> getQuestionWithName(String searchVal) {
        if (searchVal.equals("")){
            return questionMapper.selectByExample(null);
        }
        QuestionExample example = new QuestionExample();
        QuestionExample.Criteria criteria = example.createCriteria();
        criteria.andQuestionNameLike("%"+searchVal+"%");
        return questionMapper.selectByExample(example);
    }
}
