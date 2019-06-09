package com.ldu.bs.controller;

import com.ldu.bs.bean.Company;
import com.ldu.bs.bean.Emp;
import com.ldu.bs.bean.Msg;
import com.ldu.bs.bean.Resume;
import com.ldu.bs.service.CompanyService;
import com.ldu.bs.service.EmpService;
import com.ldu.bs.service.ResumeService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    EmpService empService;
    @Autowired
    CompanyService companyService;
    @Autowired
    ResumeService resumeService;

    @RequestMapping("/bindstep1")
    public String bindstep1(){
        return "bindstep1";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/register")
    public String register(){
        return "register";
    }
    @RequestMapping("/quit")
    public String quit(HttpSession httpSession){
        httpSession.removeAttribute("emp");
        httpSession.removeAttribute("company");
        return "redirect:home";
    }

    @RequestMapping("/loginValidate")
    public String loginValidate(HttpServletRequest request, HttpSession httpSession, Model model){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        if(type.equals("0")){
            List<Emp> emps = empService.getUser(email);
            if (emps.size() == 0){
                model.addAttribute("msg","该账号尚未注册，请先注册！");
                return "login";
            }else if (emps.get(0).getPwd().equals(password)){
                httpSession.setAttribute("emp",emps.get(0));
                boolean b = resumeService.checkResume(emps.get(0).getEmpId());
                if(b){
                    httpSession.setAttribute("resume",null);
                }else{
                    Resume resume = resumeService.getResume(emps.get(0).getEmpId());

                    httpSession.setAttribute("resume",resume);
                }
                return "home";
            }else{
                model.addAttribute("msg","密码不正确！");
                return "login";
            }
        }else{
            List<Company> companies = companyService.getCompany(email);
            if (companies.size() == 0){
                model.addAttribute("msg","该账号尚未注册，请先注册！");
                return "login";
            }else if (companies.get(0).getCompanyPwd().equals(password)){
                httpSession.setAttribute("company",companies.get(0));
                return "home";
            }else{
                model.addAttribute("msg","密码不正确！");
                return "login";
            }
        }

    }


    @RequestMapping("/checkemail")
    @ResponseBody
    public Msg checkemail(@RequestParam("email") String email,@RequestParam("type") Integer type){
        //数据库邮箱重复校验
        if (type == 0){
            boolean b = empService.checkEmail(email);
            if (b){
                return Msg.success();
            }else{
                return Msg.fail().add("msg","该邮箱已被注册！");
            }
        }else{
            boolean b = companyService.checkEmail(email);
            if (b){
                return Msg.success();
            }else{
                return Msg.fail().add("msg","该邮箱已被注册！");
            }
        }
    }

    @RequestMapping("/addEmp")
    @ResponseBody
    public Msg addEmp(HttpServletRequest request,HttpSession httpSession){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        if (type.equals("0")){
            empService.addEmp(email,password);
            Emp e = empService.getUser(email).get(0);
            resumeService.addResume(e.getEmpId());
            httpSession.setAttribute("resume",resumeService.getResume(e.getEmpId()));
            return Msg.success();
        }else{
            companyService.addComp(email,password);
            httpSession.setAttribute("companyEmail",email);
            return Msg.success();
        }
    }

    @RequestMapping("/accountBind")
    public String accountBind(){
        return "updatePwd";
    }

    @ResponseBody
    @RequestMapping("/updatePwd")
    public JSONObject updatePwd(HttpSession httpSession,String oldPassword,String newPassword,String newPassword2){
        Emp emp = (Emp) httpSession.getAttribute("emp");
        Company company = (Company) httpSession.getAttribute("company");
        JSONObject obj = new JSONObject();
        if (emp != null){
            if (emp.getPwd().equals(oldPassword)){
                if (newPassword.equals(newPassword2)){
                    emp.setPwd(newPassword);
                    empService.updateInfo(emp);
                    obj.put("success",true);
                    obj.put("msg","密码修改成功");
                }else {
                    obj.put("success",false);
                    obj.put("msg","两次输入的密码不一致，请重新输入");
                }
            }else {
                obj.put("success",false);
                obj.put("msg","原密码不正确");
            }
        }
        if (company != null){
            if (company.getCompanyPwd().equals(oldPassword)){
                if (newPassword.equals(newPassword2)){
                    company.setCompanyPwd(newPassword);
                    companyService.updateCompanyInfo(company);
                    obj.put("success",true);
                    obj.put("msg","密码修改成功");
                }else {
                    obj.put("success",false);
                    obj.put("msg","两次输入的密码不一致，请重新输入");
                }
            }else {
                obj.put("success",false);
                obj.put("msg","原密码不正确");
            }
        }
        return obj;
    }
}
