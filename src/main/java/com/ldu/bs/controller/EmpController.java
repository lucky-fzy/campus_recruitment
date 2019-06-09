package com.ldu.bs.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ldu.bs.bean.Emp;
import com.ldu.bs.bean.Msg;
import com.ldu.bs.bean.Resume;
import com.ldu.bs.service.EmpService;
import com.ldu.bs.service.ResumeService;
import com.sun.org.apache.regexp.internal.RE;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class EmpController {
    @Autowired
    ResumeService resumeService;
    @Autowired
    EmpService empService;

    @RequestMapping("/jianli")
    public String jianli(){
        return "jianli";
    }

    @RequestMapping("/jianli.do")
    public String updateInfo(HttpServletRequest request,HttpSession httpSession){
        Resume r = (Resume)httpSession.getAttribute("resume");
        Integer resumeId = r.getResumeId();
        String name = request.getParameter("name");
        String gender;
        if (request.getParameter("gender").equals("男")){
            gender = "1";
        }else {
            gender = "0";
        }

        String topDegree = request.getParameter("topDegree");
        String phone = request.getParameter("tel");

        Resume resume = new Resume();
        Emp emp = new Emp();
        Emp e = (Emp) httpSession.getAttribute("emp");
        emp.setEmpId(e.getEmpId());
        emp.setEmpName(name);
        emp.setGender(gender);
        resume.setDegree(topDegree);
        resume.setPhone(phone);
        resume.setResumeId(resumeId);

        resumeService.updateResume(resume);
        empService.updateInfo(emp);
        httpSession.removeAttribute("emp");
        httpSession.removeAttribute("resume");
        httpSession.setAttribute("emp",empService.getUser(e.getEmail()).get(0));
        httpSession.setAttribute("resume",resumeService.getResume(e.getEmpId()));
        return "jianli";
    }

    @ResponseBody
    @RequestMapping(value = "/upload_head")
    public JSONObject upload_head(HttpServletRequest request, HttpSession httpSession) {
        Emp emp = (Emp) httpSession.getAttribute("emp");
        String url = "";
        try {
            //上传后的地址，注意("/upload")是表示文件上传后的目标文件夹
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("headPic");
            //String realPath = request.getSession().getServletContext().getRealPath("/upload");
            String realPath = "C:\\Users\\19653\\Desktop\\毕设\\campus_recruitment\\upload\\emp_head";
            System.out.println("打印文件上传的路径"+realPath);
            //获取文件名

            String filename = file.getOriginalFilename();

            //获取文件后缀名

            String extensionname = filename.substring(filename.lastIndexOf(".") + 1);

            //给上传的文件起别名，有很多种方式

            String newFilename=String.valueOf(System.currentTimeMillis())+"."+extensionname;

            //创建File对象，传入目标路径参数，和新的文件别名

            File dir=new File(realPath,newFilename);

            if (!dir.exists()){//如果dir代表的文件不存在，则创建它，

                dir.mkdirs();//

            }

            //如果存在则直接执行下面操作

            file.transferTo(dir);//将上传的实体文件复制到指定目录upload下

            //second.setFile(newFilename);//将文件名赋值给实体类，然后一并存到数据库

            //secondservice.secondSave(second);//调用后台方法，将对象存进数据库

            Resume resume = resumeService.getResume(emp.getEmpId());
            url = "http://localhost:8080/upload/emp_head/"+newFilename;
            resume.setPhoto(url);
            resumeService.updateResume(resume);
            httpSession.setAttribute("resume",resume);
            System.out.println("测试是否执行完毕");

        } catch (IOException e) {

            e.printStackTrace();

        }

        JSONObject obj = new JSONObject();
        obj.put("success",true);
        obj.put("content",url);
        return obj;
    }
}
