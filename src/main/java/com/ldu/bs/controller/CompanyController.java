package com.ldu.bs.controller;

import com.ldu.bs.bean.*;
import com.ldu.bs.service.*;
import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import com.ldu.bs.utils.SendEmail;

@Controller
public class CompanyController {

    @Autowired
    CompanyService companyService;
    @Autowired
    PositionService positionService;
    @Autowired
    ResumeService resumeService;
    @Autowired
    ToudiService toudiService;
    @Autowired
    AuthenticationService authenticationService;

    @RequestMapping("/phone_email")
    public String phone_email(HttpServletRequest request, HttpSession httpSession) {
        String phone = request.getParameter("tel");
        String email = request.getParameter("email");
        String companyEmail = (String) httpSession.getAttribute("companyEmail");
        Company company = companyService.getCompany(companyEmail).get(0);
        company.setCompanyPhone(phone);
        company.setReceiveEmail(email);
        companyService.updateCompanyInfo(company);
        return "bindstep2";
    }

    @RequestMapping("/company_name")
    public String company_name(HttpServletRequest request, HttpSession httpSession) throws MessagingException, AddressException {
        String company_name = request.getParameter("companyName");
        String companyEmail = (String) httpSession.getAttribute("companyEmail");
        Company company = companyService.getCompany(companyEmail).get(0);
        company.setAllname(company_name);
        companyService.updateCompanyInfo(company);
        SendEmail.sendEmail(companyEmail,"【校园招】感谢使用校园招,点击以下链接激活账户");
        return "bindstep3";
    }

    @RequestMapping("/companylist_select")
    @ResponseBody
    public Msg company_select(String city, String stage, String field) {
        List<Company> companies = companyService.getCompanys(city, stage, field);
        return Msg.success().add("company", companies);
    }

    @RequestMapping("/myhome")
    public String myhome(Model model, HttpSession httpSession) {
        Company company = (Company) httpSession.getAttribute("company");
        List<Position> positions = positionService.onlinePosition(company.getCompanyId());
        Boolean isAuth = authenticationService.getLicense(company.getCompanyId());
        model.addAttribute("isAuth", isAuth);
        model.addAttribute("positions", positions);
        return "myhome";
    }

    @RequestMapping("/companyhome")
    public String companyhome(Integer companyId, Model model) {
        Company company = companyService.getCompanyDetail(companyId);
        List<Position> positions = positionService.onlinePosition(companyId);
        model.addAttribute("company_detail", company);
        model.addAttribute("positions", positions);
        return "companyhome";
    }

    @RequestMapping("/create")
    public String create(Model model) {
        model.addAttribute("createOrUpdate", "create");
        return "create";
    }

    @RequestMapping("/positions")
    public String positions(HttpSession httpSession, Model model, String isOnline) {
        Company company = (Company) httpSession.getAttribute("company");
        List<Position> positions = positionService.getPositionWithCom(company.getCompanyId());
        List<Position> positionsSelect = new ArrayList<>();
        if (isOnline.equals("1")) {
            for (int i = 0; i < positions.size(); i++) {
                if (positions.get(i).getIsOnline().equals("1")) {
                    positionsSelect.add(positions.get(i));
                }
            }
            model.addAttribute("online", "1");
            httpSession.setAttribute("positions", positionsSelect);
            return "positions";
        } else {
            for (int i = 0; i < positions.size(); i++) {
                if (positions.get(i).getIsOnline().equals("0")) {
                    positionsSelect.add(positions.get(i));
                }
            }
            model.addAttribute("online", "0");
            httpSession.setAttribute("positions", positionsSelect);
            return "positions";
        }
    }

    @RequestMapping("/resume")
    public String resume(HttpSession httpSession, Model model) {
        Company company = (Company) httpSession.getAttribute("company");
        List<Position> positions = positionService.getPositionWithCom(company.getCompanyId());

        List<Integer> resumesId = toudiService.getResumeId(positions);
        List<Resume> resumes = new ArrayList<>();
        for (int i = 0; i < resumesId.size(); i++) {
            resumes.add(resumeService.getReceivedResume(resumesId.get(i)));
        }
        model.addAttribute("resumes", resumes);
        return "resume";
    }

    @RequestMapping("/updateCompanyInfo")
    public String updateCompanyInfo(Company company, HttpSession httpSession) {
        companyService.updateCompanyInfo(company);
        httpSession.setAttribute("company", companyService.getCompanyDetail(company.getCompanyId()));
        return "redirect:myhome";
    }

    @RequestMapping("updateCompanyInfos")
    @ResponseBody
    public Msg updateCompanyInfos(Company company, HttpSession httpSession) {
        companyService.updateCompanyInfo(company);
        httpSession.setAttribute("company", companyService.getCompanyDetail(company.getCompanyId()));
        return Msg.success();
    }

    @RequestMapping("/auth")
    public String auth() {
        return "auth";
    }

    @RequestMapping("/authSuccess")
    public String authSuccess() {
        return "authSuccess";
    }


    @ResponseBody
    @RequestMapping(value = "/uploadLicense", method = RequestMethod.POST)
    public String secondsave(HttpServletRequest request, Integer companyId) {
        try {
            //上传后的地址，注意("/upload")是表示文件上传后的目标文件夹
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("businessLicenes");
            //String realPath = request.getSession().getServletContext().getRealPath("/upload");
            String realPath = "C:\\Users\\19653\\Desktop\\毕设\\campus_recruitment\\upload\\isAuth";
            System.out.println("打印文件上传的路径" + realPath);
            //获取文件名

            String filename = file.getOriginalFilename();

            //获取文件后缀名

            String extensionname = filename.substring(filename.lastIndexOf(".") + 1);

            //给上传的文件起别名，有很多种方式

            String newFilename = String.valueOf(System.currentTimeMillis()) + "." + extensionname;

            //创建File对象，传入目标路径参数，和新的文件别名

            File dir = new File(realPath, newFilename);

            if (!dir.exists()) {//如果dir代表的文件不存在，则创建它，

                dir.mkdirs();//

            }

            //如果存在则直接执行下面操作

            file.transferTo(dir);//将上传的实体文件复制到指定目录upload下

            //second.setFile(newFilename);//将文件名赋值给实体类，然后一并存到数据库

            //secondservice.secondSave(second);//调用后台方法，将对象存进数据库

            Date date = new Date();
            String temp_str = "";
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            temp_str = sdf.format(date);
            authenticationService.addAuthentication(companyId, "http://localhost:8080/upload/isAuth/" + newFilename, temp_str);
            System.out.println("测试是否执行完毕");

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "authSuccess";
    }


    @RequestMapping("/companyLogoUpload")
    @ResponseBody
    public JSONObject companyLogoUpload(HttpServletRequest request, HttpSession httpSession, Integer companyId) {
        String url = "";
        try {
            //上传后的地址，注意("/upload")是表示文件上传后的目标文件夹
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("logo");
            //String realPath = request.getSession().getServletContext().getRealPath("/upload");
            String realPath = "C:\\Users\\19653\\Desktop\\毕设\\campus_recruitment\\upload\\company_logo";
            System.out.println("打印文件上传的路径" + realPath);
            //获取文件名

            String filename = file.getOriginalFilename();

            //获取文件后缀名

            String extensionname = filename.substring(filename.lastIndexOf(".") + 1);

            //给上传的文件起别名，有很多种方式

            String newFilename = String.valueOf(System.currentTimeMillis()) + "." + extensionname;

            //创建File对象，传入目标路径参数，和新的文件别名

            File dir = new File(realPath, newFilename);

            if (!dir.exists()) {//如果dir代表的文件不存在，则创建它，

                dir.mkdirs();//

            }

            //如果存在则直接执行下面操作

            file.transferTo(dir);//将上传的实体文件复制到指定目录upload下

            //second.setFile(newFilename);//将文件名赋值给实体类，然后一并存到数据库

            //secondservice.secondSave(second);//调用后台方法，将对象存进数据库

            Company company = new Company();
            company.setCompanyId(companyId);
            url = "http://localhost:8080/upload/company_logo/" + newFilename;
            company.setCompanyLogo(url);
            companyService.updateCompanyInfo(company);
            company = companyService.getCompanyDetail(companyId);
            httpSession.setAttribute("company", company);
            System.out.println("测试是否执行完毕");

        } catch (IOException e) {
            e.printStackTrace();
        }
        JSONObject obj = new JSONObject();
        obj.put("success", true);
        obj.put("content", url);
        return obj;
    }
}
