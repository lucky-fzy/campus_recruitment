package com.ldu.bs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ldu.bs.bean.*;
import com.ldu.bs.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    BigClassService bigClassService;
    @Autowired
    MidClassService midClassService;
    @Autowired
    SmallClassService smallClassService;
    @Autowired
    PositionService positionService;
    @Autowired
    CompanyService companyService;
    @Autowired
    AdService adService;


    @RequestMapping("/home")
    public String getBigClass(@RequestParam(value = "pn",defaultValue = "1")Integer pn, HttpSession httpSession){
        List<BigClass> bigClasses = bigClassService.getAll();
        httpSession.setAttribute("bigJob",bigClasses);
        List<MidClass> midClasses = midClassService.getAll();
        httpSession.setAttribute("midJob",midClasses);
        List<SmallClass> smallClasses = smallClassService.getAll();
        httpSession.setAttribute("smallJob",smallClasses);

        List<SmallClass> hotJob = smallClassService.selectHot();
        httpSession.setAttribute("hotJob",hotJob);

        PageHelper.startPage(pn,10);
        List<Position> positions = positionService.getAll();
        PageInfo pageInfo = new PageInfo(positions,5);
        httpSession.setAttribute("positions",pageInfo);

        List<Position> full_time = positionService.getFullTime();
        httpSession.setAttribute("full_time",full_time);
        List<Position> part_time = positionService.getPartTime();
        httpSession.setAttribute("part_time",part_time);
        List<Ad> ads = adService.getAds();
        httpSession.setAttribute("ads",ads);
        return "home";
    }

    @RequestMapping("/companylist")
    public String Companylist(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model){

        PageHelper.startPage(pn,3);
        List<Company> companies = companyService.getAllCompany();
        PageInfo pageInfo = new PageInfo(companies,5);
        model.addAttribute("companies",pageInfo);
        return "companylist";
    }

}
