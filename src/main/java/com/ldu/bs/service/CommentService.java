package com.ldu.bs.service;

import com.ldu.bs.bean.*;
import com.ldu.bs.dao.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CommentService {

    @Autowired
    CommentMapper commentMapper;
    @Autowired
    EmpService empService;
    @Autowired
    QuestionService questionService;

    public List<Comment> getCommentsWithQuestion(Integer questionId) {
        CommentExample example = new CommentExample();
        CommentExample.Criteria criteria = example.createCriteria();
        criteria.andQuestionIdEqualTo(questionId);
        return commentMapper.selectByExample(example);
    }

    public List<Comment> getComment(Integer empId) {
        CommentExample example = new CommentExample();
        CommentExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdEqualTo(empId);
        return commentMapper.selectByExample(example);
    }

    public void addComment(Comment comment) {
        commentMapper.insertSelective(comment);
    }

    public List<Comment> getAllComment() {
        return commentMapper.selectByExample(null);
    }

    public Comment getCommentWithId(Integer commentId) {
        return commentMapper.selectByPrimaryKey(commentId);
    }

    public void updateComment(Comment comment) {
        commentMapper.updateByPrimaryKeySelective(comment);
    }

    public void delComment(Integer commentId) {
        commentMapper.deleteByPrimaryKey(commentId);
    }

    public List<Comment> searchComments(String searchVal) {
        List<Comment> comments = new ArrayList<>();
        List<Comment> comments1 = new ArrayList<>();
        CommentExample commentExample = new CommentExample();
        CommentExample.Criteria criteria1 = commentExample.createCriteria();
        criteria1.andCommentContentLike("%"+searchVal+"%");
        List<Emp> emps = empService.getEmpWithName(searchVal);
        if (emps.size() != 0){
            List<Integer> empIds = emps.stream().map(Emp::getEmpId).collect(Collectors.toList());
            CommentExample empExample = new CommentExample();
            CommentExample.Criteria empCriteria = empExample.createCriteria();
            empCriteria.andEmpIdIn(empIds);
            comments = commentMapper.selectByExample(empExample);
        }
        List<Question> questions = questionService.getQuestionWithName(searchVal);
        if (questions.size() != 0){
            List<Integer> questionIds = questions.stream().map(Question::getQuestionId).collect(Collectors.toList());
            CommentExample questionExample = new CommentExample();
            CommentExample.Criteria questionCriteria = questionExample.createCriteria();
            questionCriteria.andQuestionIdIn(questionIds);
            comments1 = commentMapper.selectByExample(questionExample);
        }
        comments.addAll(commentMapper.selectByExample(commentExample));
        comments.addAll(comments1);
        return comments;
    }
}
