package com.ldu.bs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ldu.bs.bean.*;
import com.ldu.bs.service.CollectService;
import com.ldu.bs.service.CompanyService;
import com.ldu.bs.service.PositionService;
import javafx.geometry.Pos;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.stream.Collectors;


@Controller
public class PositionController {

    @Autowired
    PositionService positionService;
    @Autowired
    CompanyService companyService;
    @Autowired
    CollectService collectService;

    @RequestMapping("/list")
    public String list(){
        return "list";
    }

    @RequestMapping("/positionlist")
    public String position_list(@RequestParam(value = "pn",defaultValue = "1")Integer pn,HttpSession httpSession){
        PageHelper.startPage(pn,10);
        List<Position> positions = positionService.getAll();
        PageInfo pageInfo = new PageInfo(positions,5);
        httpSession.setAttribute("positions",pageInfo);
        return "redirect:list";
    }

    @RequestMapping("/search")
    @ResponseBody
    public Msg search(@RequestParam(value = "pn",defaultValue = "1")Integer pn,@RequestParam("type") String type, @RequestParam("value") String value, HttpSession httpSession){
        if (type.equals("职位")){
            PageHelper.startPage(pn,10);
            List<Position> positions = positionService.getPositionWithName(value);
            PageInfo pageInfo = new PageInfo(positions,5);
            httpSession.setAttribute("positions",pageInfo);
            return Msg.success().add("positions",pageInfo);
        }else if(type.equals("公司")){
            PageHelper.startPage(pn,10);
            List<Position> positions = positionService.searchPositions("companyName",value);
            PageInfo pageInfo = new PageInfo(positions,5);
            httpSession.setAttribute("positions",pageInfo);

            return Msg.success().add("positions",pageInfo);
        }else {
            PageHelper.startPage(pn,10);
            List<Position> positions = positionService.searchPositions("midName",value);
            PageInfo pageInfo = new PageInfo(positions,5);
            httpSession.setAttribute("positions",pageInfo);
            return Msg.success().add("positions",pageInfo);
        }
    }

    @RequestMapping("/jobdetail")
    public String jobdetail(Integer positionId, Model model,HttpSession httpSession){
        Position position = positionService.getJobDetail(positionId);
        if (httpSession.getAttribute("emp") != null){
            Emp emp = (Emp) httpSession.getAttribute("emp");
            int empId = emp.getEmpId();
            Collect collect = collectService.selectCollection(positionId,empId);
            model.addAttribute("collect",collect);
        }
        model.addAttribute("position",position);
        return "jobdetail";
    }

    @RequestMapping("/collect")
    public String collect(HttpSession httpSession,Integer positionId){
        Emp emp = (Emp) httpSession.getAttribute("emp");
        emp.getEmpId();
        System.out.println(positionId);
        return "jobdetail";
    }

    @RequestMapping("/createPosition")
    @ResponseBody
    public String createPosition(String createOrUpdate,Integer positionId,String positionType,String positionName,String department,String jobNature,
                                Integer salaryMin,Integer salaryMax,String workAddress,String workYear,String education,
                                 String positionAdvantage,String positionDetail,String positionAddress,HttpSession httpSession,
                                    Model model){
        Position position = new Position();
        Company company = (Company) httpSession.getAttribute("company");
        position.setPositionId(positionId);
        position.setPositionType(positionType);
        position.setCompanyId(company.getCompanyId());
        position.setDegree(education);
        position.setDepartment(department);
        position.setJobAddr(positionAddress);
        position.setJobCity(workAddress);
        position.setJobExperience(workYear);
        position.setMaxSalary(salaryMax);
        position.setMinSalary(salaryMin);
        position.setJobType(jobNature);
        position.setPositionDescribe(positionDetail);
        position.setPositionTemptation(positionAdvantage);
        position.setPositionName(positionName);
        position.setIsOnline("1");

        Calendar now = Calendar.getInstance();
        position.setReleaseTime(now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH)+1)+"-"+now.get(Calendar.DAY_OF_MONTH));

        if (createOrUpdate.equals("create")){
            positionService.addPosition(position);
            model.addAttribute("createOrUpdate","create");
            return "create";
        }else{
            positionService.updatePosition(position);
            model.addAttribute("createOrUpdate","update");
            return "redirect:positions?isOnline="+"1";
        }
    }

    @RequestMapping("/addPosition")
    public Msg addPosition(Map position){
        System.out.println(position.get("positionType"));
        return Msg.success();
    }

    @RequestMapping("/jobOffline")
    @ResponseBody
    public Msg jobOffline(Position position){
        position.setIsOnline("0");
        positionService.updataIsOnline(position);
        return Msg.success();
    }

    @RequestMapping("/jobOnline")
    @ResponseBody
    public Msg jobOnline(Position position){
        position.setIsOnline("1");
        positionService.updataIsOnline(position);
        return Msg.success();
    }

    @RequestMapping("/jobDel")
    @ResponseBody
    public Msg jobDel(Integer positionId){
        positionService.deletePosition(positionId);
        return Msg.success();
    }

    @RequestMapping("/update")
    public String updateJob(Model model,Integer positionId){
        Position position = positionService.getPosition(positionId);
        model.addAttribute("positionDetail",position);
        model.addAttribute("createOrUpdate","update");
        return "create";
    }

    @RequestMapping("/positionlist_select")
    @ResponseBody
    public Msg positionlist_select(String city,String salary,String job_experience,String degree,String job_type,HttpSession httpSession){
        PageInfo positionsPage = (PageInfo) httpSession.getAttribute("positions");
        List<Position> searchPositions = positionsPage.getList();
        List<Integer> searchPositionIds = new ArrayList<>();
        if (searchPositions.size() == 0){
            return Msg.success().add("positions",searchPositions);
        }else{
            searchPositionIds =searchPositions.stream().map(Position::getPositionId).collect(Collectors.toList());
        }

        List<Position> positions = positionService.selectPositionsWithMore(city,salary,job_experience,degree,job_type);
        List<Integer> positionIds = new ArrayList<>();
        if (positions.size() == 0){
            return Msg.success().add("positions",positions);
        }else {
            positionIds.addAll(positions.stream().map(Position::getPositionId).collect(Collectors.toList()));
        }
        List<Integer> ids = searchPositionIds.stream().filter(item -> positionIds.contains(item)).collect(Collectors.toList());
        if (ids.size() == 0){
            return Msg.success().add("positions",null);
        }else{
            List<Position> positionList = positionService.getPositions(ids);
            return Msg.success().add("positions",positionList);
        }

    }


    @RequestMapping("/updateCollection")
    @ResponseBody
    public Msg updateCollection(Collect collect,Integer type){
        if (type == 1){
            collectService.addCollection(collect);
        }else {
            collectService.delCollection(collect);
        }
        return Msg.success();
    }

    @RequestMapping("/collections")
    public String collections(Model model,HttpSession httpSession){
        Emp emp = (Emp) httpSession.getAttribute("emp");
        List<Collect> collects = collectService.selectColletWithEmp(emp.getEmpId());
        List<Integer> positionIds = new ArrayList<>();
        List<Position> positions = new ArrayList<>();
        if (collects.size() != 0){
            for (int i=0;i<collects.size();i++){
                positionIds.add(collects.get(i).getPositionId());
            }
            positions = positionService.getPositions(positionIds);
        }
        model.addAttribute("positions",positions);
        return "collections";
    }

    @RequestMapping("/offCollect")
    @ResponseBody
    public Msg offCollect(Collect collect){
        collectService.delCollection(collect);
        return Msg.success();
    }
}
