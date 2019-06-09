package com.ldu.bs.controller;

import com.ldu.bs.bean.*;
import com.ldu.bs.service.EmpService;
import com.ldu.bs.service.PositionService;
import com.ldu.bs.service.ResumeService;
import com.ldu.bs.service.ToudiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ResumeController {
    @Autowired
    ResumeService resumeService;
    @Autowired
    EmpService empService;
    @Autowired
    ToudiService toudiService;
    @Autowired
    PositionService positionService;

    @RequestMapping("/addJob")
    public String addJob(HttpServletRequest request,HttpSession httpSession){
        Resume resume = (Resume)httpSession.getAttribute("resume");
        resume.setCity(request.getParameter("expectCity"));
        resume.setJobtype(request.getParameter("type"));
        resume.setPosition(request.getParameter("expectPosition"));
        resume.setSalary(request.getParameter("expectSalary"));
        resumeService.updateResume(resume);
        httpSession.setAttribute("resume",resume);
        return "redirect:jianli";
    }

    @RequestMapping("/addProject")
    public String addProject(HttpServletRequest request,HttpSession httpSession){
        Resume resume = (Resume)httpSession.getAttribute("resume");
        resume.setProject(request.getParameter("projectName"));
        resume.setPost(request.getParameter("thePost"));
        resume.setStarttime(request.getParameter("projectYearStart")+request.getParameter("projectMonthStart"));
        resume.setEndtime(request.getParameter("projectYearEnd")+request.getParameter("projectMonthEnd"));
        resume.setJobdescribe(request.getParameter("projectDescription"));
        resumeService.updateResume(resume);
        httpSession.setAttribute("resume",resume);
        return "redirect:jianli";
    }

    @RequestMapping("/addEdu")
    public String addEdu(HttpServletRequest request,HttpSession httpSession){
        Emp emp = (Emp) httpSession.getAttribute("emp");
        emp.setSchool(request.getParameter("schoolName"));
        empService.updateInfo(emp);

        Resume resume = (Resume)httpSession.getAttribute("resume");
        resume.setMajor(request.getParameter("professionalName"));
        resume.setDegree(request.getParameter("degree"));
        resumeService.updateResume(resume);

        return "redirect:jianli";
    }

    @RequestMapping("/addSelfDescription")
    public String addSelfDescription(HttpServletRequest request,HttpSession httpSession){
        Resume resume = (Resume)httpSession.getAttribute("resume");
        resume.setSelfdescribe(request.getParameter("selfDescription"));
        resumeService.updateResume(resume);
        return "redirect:jianli";
    }

    @RequestMapping("/preview")
    public String preview(){
        return "preview";
    }

    @RequestMapping("/resumeSend")
    public String resumeSend(Toudi toudi){
        Resume resume = resumeService.getReceivedResume(toudi.getResumeId());
        resumeService.addNewResume(resume);
        Integer resumeId = resumeService.getResume(resume.getEmpId()).getResumeId();
        toudi.setResumeId(resumeId);
        toudiService.addToudi(toudi);
        return "redirect:jobdetail?positionId="+toudi.getPositionId();
    }

    public List<Toudi> select_toudi(String type){
        List<Toudi> toudis = new ArrayList<>();
        Resume resume;
        if (type.equals("3")){
            toudis = toudiService.getResumes(3);
        }else if (type.equals("0")){
            toudis = toudiService.getResumes(0);
        }else if (type.equals("1")){
            toudis = toudiService.getResumes(1);
        }else if (type.equals("2")){
            toudis = toudiService.getResumes(2);
        }
        for (int i=0;i<toudis.size();i++){
            resume = resumeService.getReceivedResume(toudis.get(i).getResumeId());
            resume.setEmp(empService.getEmp(resume.getEmpId()));
            toudis.get(i).setResume(resume);
        }
        return toudis;
    }

    @RequestMapping("/select_resume")
    @ResponseBody
    public Msg select_resume(String degree,Integer positionId,Integer type){
        Resume resume;
        List<Toudi> toudis = toudiService.selectToudi(degree,positionId,type);
        for (int i=0;i<toudis.size();i++){
            resume = resumeService.getReceivedResume(toudis.get(i).getResumeId());
            resume.setEmp(empService.getEmp(resume.getEmpId()));
            toudis.get(i).setResume(resume);
        }
        return Msg.success().add("toudis",toudis);
    }

    @RequestMapping("/selectResume")
    public String selectResume(String degree,Integer positionId,Integer type,Model model,HttpSession httpSession){

        Resume resume;
        List<Toudi> toudis = toudiService.selectToudi(degree,positionId,type);
        for (int i=0;i<toudis.size();i++){
            resume = resumeService.getReceivedResume(toudis.get(i).getResumeId());
            resume.setEmp(empService.getEmp(resume.getEmpId()));
            toudis.get(i).setResume(resume);
        }
        model.addAttribute("selectResumes",toudis);
        Company company = (Company) httpSession.getAttribute("company");
        List<Position> positions = positionService.getPositionWithCom(company.getCompanyId());
        model.addAttribute("recruitPosition",positions);
        model.addAttribute("degree",degree);
        model.addAttribute("positionId",positionId);
        if (type == 3){
            return "canInterviewResumes";
        }else if (type == 0){
            return "PendingResume";
        }else if (type == 1){
            return "haveRefuseResumes";
        }else if (type == 2){
            return "improperResumes";
        }
        return "PendingResume";
    }

    @RequestMapping("/select_Resumes")
    public String canInterviewResumes(Model model,HttpSession httpSession,String type)
    {
        List<Toudi> toudis = select_toudi(type);
        model.addAttribute("selectResumes",toudis);
        Company company = (Company) httpSession.getAttribute("company");
        List<Position> positions = positionService.getPositionWithCom(company.getCompanyId());
        model.addAttribute("recruitPosition",positions);
        if (type.equals("3")){
            return "canInterviewResumes";
        }else if (type.equals("0")){
            return "PendingResume";
        }else if (type.equals("1")){
            return "haveRefuseResumes";
        }else if (type.equals("2")){
            return "improperResumes";
        }
        return "PendingResume";
    }

    @RequestMapping("/resume_notice")
    @ResponseBody
    public Msg resumeNotice(Toudi toudi){
        toudi.setToudiType(1);
        toudiService.updateInfo(toudi);
        return Msg.success();
    }

    @RequestMapping("/resume_refuse")
    @ResponseBody
    public Msg resumeRefuse(Toudi toudi){
        toudi.setToudiType(2);
        toudiService.updateInfo(toudi);
        return Msg.success();
    }

    /*
    * 批量通过
    * */
    @RequestMapping("/resumeRefuseAll")
    @ResponseBody
    public Msg resumeRefuseAll(String toudiIds){
        String[] str_ids = toudiIds.split(",");
        //组装id的集合

        Toudi toudi = new Toudi();
        toudi.setToudiType(2);
        for (String string: str_ids) {
            toudi.setToudiId(Integer.parseInt(string));
            toudiService.updateInfo(toudi);
        }
        return Msg.success();
    }

    @RequestMapping("/resume_caninterview")
    @ResponseBody
    public Msg resume_caninterview(Toudi toudi){
        toudi.setToudiType(3);
        toudiService.updateInfo(toudi);
        return Msg.success();
    }

    @RequestMapping("/resume_del")
    @ResponseBody
    public Msg resume_del(Toudi toudi){
        toudi.setToudiType(4);
        toudiService.updateInfo(toudi);
        return Msg.success();
    }

    /*
    * 批量删除
    * */
    @RequestMapping("/resumeDeleteAll")
    @ResponseBody
    public Msg resumeDeleteAll(String toudiIds){
        String[] str_ids = toudiIds.split(",");
        //组装id的集合
        Toudi toudi = new Toudi();
        toudi.setToudiType(4);
        for (String string: str_ids) {
            toudi.setToudiId(Integer.parseInt(string));
            toudiService.updateInfo(toudi);
        }
        return Msg.success();
    }

    /*
    * 批量待定
    * */
    @RequestMapping("/resumeCanInterviewAll")
    @ResponseBody
    public Msg resumeCanInterviewAll(String toudiIds){
        String[] str_ids = toudiIds.split(",");
        //组装id的集合
        Toudi toudi = new Toudi();
        toudi.setToudiType(3);
        for (String string: str_ids) {
            toudi.setToudiId(Integer.parseInt(string));
            toudiService.updateInfo(toudi);
        }
        return Msg.success();
    }

    /*
    * 公司预览简历
    * */
    @RequestMapping("/resumeView")
    public String resumeView(String resumeId,Model model){
        Resume resume = resumeService.getReceivedResume(Integer.parseInt(resumeId));
        resume.setEmp(empService.getEmp(resume.getEmpId()));
        model.addAttribute("resumeView",resume);
        return "resumeView";
    }


    @RequestMapping("/delivery")
    public String delivery(Integer type,HttpSession httpSession,Model model){
        Emp emp = (Emp) httpSession.getAttribute("emp");
        List<Toudi> toudis = toudiService.getToudiInfo(emp.getEmpId(),type);
        for (int i=0;i<toudis.size();i++){
            toudis.get(i).setPosition(positionService.getJobDetail(toudis.get(i).getPositionId()));
            switch (toudis.get(i).getToudiType()){
                case 0:  toudis.get(i).setType("未处理"); break;
                case 1:  toudis.get(i).setType("通知面试"); break;
                case 3:  toudis.get(i).setType("待定"); break;
                case 2:  toudis.get(i).setType("不合适"); break;
            }
        }
        model.addAttribute("toudis",toudis);
        model.addAttribute("type",type);
        return "delivery";
    }
}
