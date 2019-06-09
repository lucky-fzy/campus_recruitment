package com.ldu.bs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ldu.bs.bean.*;
import com.ldu.bs.service.CommentService;
import com.ldu.bs.service.EmpService;
import com.ldu.bs.service.QuestionService;
import com.ldu.bs.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class yanzhiController {
    @Autowired
    QuestionService questionService;
    @Autowired
    CommentService commentService;
    @Autowired
    EmpService empService;
    @Autowired
    ResumeService resumeService;

    @RequestMapping("/yanzhi")
    public String yanzhi_home(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model, HttpSession httpSession){
        PageHelper.startPage(pn,5);
        List<Question> questions = questionService.getAllQuestion();
        for (int i=0;i<questions.size();i++){
            List<Comment> comments = commentService.getCommentsWithQuestion(questions.get(i).getQuestionId());
            for (int j=0;j<comments.size();j++){
                Emp emp1 = empService.getEmp(comments.get(j).getEmpId());
                Resume resume1 = resumeService.getResume(comments.get(j).getEmpId());
                comments.get(j).setEmp(emp1);
                comments.get(j).setResume(resume1);
            }
            Emp emp = empService.getEmp(questions.get(i).getEmpId());
            Resume resume = resumeService.getResume(questions.get(i).getEmpId());
            questions.get(i).setComments(comments);
            questions.get(i).setEmp(emp);
            questions.get(i).setResume(resume);
        }
        if (httpSession.getAttribute("emp") !=null){
            Emp e = (Emp) httpSession.getAttribute("emp");
            int ask_num = questionService.getQuestion(e.getEmpId()).size();
            int answer_num = commentService.getComment(e.getEmpId()).size();
            model.addAttribute("ask_num",ask_num);
            model.addAttribute("answer_num",answer_num);
            model.addAttribute("questionType","热议话题");
        }


        PageInfo pageInfo = new PageInfo(questions,5);
        model.addAttribute("questions",pageInfo);
        return "yanzhi";
    }

    @RequestMapping("/askNew")
    public String askNew(Question question){
        SimpleDateFormat dateFormat = new SimpleDateFormat(" yyyy-MM-dd ");
        String currentDate =   dateFormat.format( new Date() );
        question.setQuestionDate(currentDate);
        questionService.addQuestion(question);
        return "redirect:yanzhi";
    }

    @RequestMapping("/add_comment")
    public String add_comment(Comment comment){
        SimpleDateFormat dateFormat = new SimpleDateFormat(" yyyy-MM-dd ");
        String currentDate =   dateFormat.format( new Date() );
        comment.setCommentDate(currentDate);
        commentService.addComment(comment);
        return "redirect:/yanzhi";
    }

    @RequestMapping("/myQuestion")
    public String myQuestion(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Integer empId,Model model){
        PageHelper.startPage(pn,50);
        List<Question> questions = questionService.getQuestion(empId);
        for (int i=0;i<questions.size();i++){
            List<Comment> comments = commentService.getCommentsWithQuestion(questions.get(i).getQuestionId());
            for (int j=0;j<comments.size();j++){
                Emp emp1 = empService.getEmp(comments.get(j).getEmpId());
                Resume resume1 = resumeService.getResume(comments.get(j).getEmpId());
                comments.get(j).setEmp(emp1);
                comments.get(j).setResume(resume1);
            }
            Emp emp = empService.getEmp(questions.get(i).getEmpId());
            Resume resume = resumeService.getResume(questions.get(i).getEmpId());
            questions.get(i).setComments(comments);
            questions.get(i).setEmp(emp);
            questions.get(i).setResume(resume);
        }
        int ask_num = questionService.getQuestion(empId).size();
        int answer_num = commentService.getComment(empId).size();
        model.addAttribute("ask_num",ask_num);
        model.addAttribute("answer_num",answer_num);

        PageInfo pageInfo = new PageInfo(questions,5);
        model.addAttribute("questions",pageInfo);
        model.addAttribute("questionType","我的话题");
        return "yanzhi";
    }
}
