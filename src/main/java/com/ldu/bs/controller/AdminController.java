package com.ldu.bs.controller;

import com.ldu.bs.bean.*;
import com.ldu.bs.service.*;
import net.sf.json.JSONObject;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    EmpService empService;
    @Autowired
    CompanyService companyService;
    @Autowired
    PositionService positionService;
    @Autowired
    MidClassService midClassService;
    @Autowired
    SmallClassService smallClassService;
    @Autowired
    BigClassService bigClassService;
    @Autowired
    ResumeService resumeService;
    @Autowired
    ToudiService toudiService;
    @Autowired
    QuestionService questionService;
    @Autowired
    CommentService commentService;
    @Autowired
    CollectService collectService;
    @Autowired
    AuthenticationService authenticationService;
    @Autowired
    AdService adService;
    @Autowired
    AdminService adminService;

    @RequestMapping("/quit_admin")
    public String quit_admin(HttpSession httpSession){
        httpSession.removeAttribute("admin");
        return "redirect:admin";
    }

    @RequestMapping("/checkAdmin")
    @ResponseBody
    public Msg adminLogin(String adminName,String adminPwd,HttpSession httpSession){
        Boolean isNull = adminService.check(adminName,adminPwd);
        if (isNull){
            return Msg.fail();
        }else {
            Admin admin = adminService.getAdmin(adminName,adminPwd);
            httpSession.setAttribute("admin",admin);
            return Msg.success();
        }
    }

    @RequestMapping("/admin")
    public String adminIndex(HttpSession httpSession){
        if (httpSession.getAttribute("admin") == null){
            return "admin/login_admin";
        }
        return "/admin/index_admin";
    }


    @RequestMapping("/welcome")
    public String welcome(Model model){
        Integer empNum = empService.getAllEmp().size();
        Integer companyNum = companyService.getAllCompany().size();
        Integer positionNum = positionService.getAll().size();
        Integer toudiNum = toudiService.getToudis().size();
        Integer questionNum = questionService.getAllQuestion().size();
        Integer commentNum = commentService.getAllComment().size();
        model.addAttribute("empNum",empNum);
        model.addAttribute("companyNum",companyNum);
        model.addAttribute("positionNum",positionNum);
        model.addAttribute("toudiNum",toudiNum);
        model.addAttribute("questionNum",questionNum);
        model.addAttribute("commentNum",commentNum);
        return "/admin/welcome";
    }

    @RequestMapping("/welcome1")
    public String welcome1(){
        return "/admin/welcome1";
    }

    @RequestMapping("/emp_list")
    public String member_list(){
        return "/admin/emp_list";
    }

    @RequestMapping("/company_list")
    public String company_list(){
        return "/admin/company_list";
    }

    @RequestMapping("/position_list")
    public String position_list(){
        return "/admin/position_list";
    }

    @RequestMapping("/resume_list")
    public String resume_list(){
        return "/admin/resume_list";
    }

    @RequestMapping("/job_class")
    public String job_class(){
        return "/admin/job_class";
    }

    @RequestMapping("/admin_companyList")
    @ResponseBody
    public Msg admin_companyList(){
        List<Company> companies = companyService.getAllCompany();
        return Msg.success().add("companys",companies);
    }

    @RequestMapping("/emp_add")
    public String emp_add(){
        return "/admin/emp_add";
    }

    @RequestMapping("/comp_add")
    public String comp_add(){
        return "/admin/comp_add";
    }

    @RequestMapping("/admin_addEmp")
    @ResponseBody
    public Msg addEmp(Emp emp){
        empService.createEmp(emp);
        return Msg.success();
    }

    @RequestMapping("/admin_updateEmp")
    @ResponseBody
    public Msg admin_updateEmp(Emp emp){
        empService.updateInfo(emp);
        return Msg.success();
    }

    @RequestMapping("/emp_edit")
    public String emp_edit(Integer empId,Model model){
        model.addAttribute("edit_emp",empService.getEmp(empId));
        return "/admin/emp_edit";
    }

    @RequestMapping("/checkEmp")
    @ResponseBody
    public Msg checkEmp(String email){
        boolean b = empService.checkEmail(email);
        if (b){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    @RequestMapping("/pwd_update")
    public String pwd_edit(Integer empId,Model model){
        model.addAttribute("edit_emp",empService.getEmp(empId));
        return "/admin/pwd_update";
    }

    @RequestMapping("/admin_updatePwd")
    @ResponseBody
    public Msg admin_updatePwd(Emp emp){
        empService.updateInfo(emp);
        return Msg.success();
    }

    @RequestMapping("/admin_empDel")
    @ResponseBody
    public Msg admin_empDel(Integer empId){
        empService.deleteEmp(empId);
        List<Emp> emps = empService.getAllEmp();
        return Msg.success().add("emps",emps);
    }

    /*批量删除求职者*/
    @RequestMapping("/admin_empsDel")
    @ResponseBody
    public Msg admin_empsDel(String empIds){
        String[] ids = empIds.split(",");
        for (int i = 0;i<ids.length;i++){
            empService.deleteEmp(Integer.parseInt(ids[i]));
        }
        List<Emp> emps = empService.getAllEmp();
        return Msg.success().add("emps",emps);
    }

    @RequestMapping("/search_emp")
    @ResponseBody
    public Msg search_emp(String searchName,String searchVal,Model model){
        List<Emp> emps = empService.searchEmp(searchName,searchVal);
        return Msg.success().add("emps",emps);
    }

    @RequestMapping("/admin_empList")
    @ResponseBody
    public Msg admin_empList(){
        List<Emp> emps = empService.getAllEmp();
        return Msg.success().add("emps",emps);
    }

    @RequestMapping("/admin_compDel")
    @ResponseBody
    public Msg admin_compDel(Integer companyId){
        companyService.delComp(companyId);
        List<Company> companies = companyService.getAllCompany();
        return Msg.success().add("companys",companies);
    }

    @RequestMapping("/admin_compsDel")
    @ResponseBody
    public Msg admin_compsDel(String compsIds){
        String[] ids = compsIds.split(",");
        for (int i = 0;i<ids.length;i++){
            companyService.delComp(Integer.parseInt(ids[i]));
        }
        List<Company> companies = companyService.getAllCompany();
        return Msg.success().add("companys",companies);
    }

    @RequestMapping("/search_company")
    @ResponseBody
    public Msg search_company(String searchVal){
        List<Company> companies = companyService.searchComp(searchVal);
        return Msg.success().add("companys",companies);
    }

    @RequestMapping("/admin_addComp")
    @ResponseBody
    public Msg addComp(Company company){
        company.setIsAuthentication("0");
        company.setCompanyLogo("http://localhost:8080/upload/company_logo/default.png");
        companyService.createComp(company);
        return Msg.success();
    }

    @RequestMapping("/admin_positionList")
    @ResponseBody
    public Msg admin_positionList(){
        List<Position> positions = positionService.getAll();
        return Msg.success().add("positions",positions);
    }

    @RequestMapping("/admin_updateOnline")
    @ResponseBody
    public Msg admin_updateOnline(Position position){
        positionService.updatePosition(position);
        return Msg.success();
    }

    @RequestMapping("/admin_positionDel")
    @ResponseBody
    public Msg admin_positionDel(Integer positionId){
        positionService.deletePosition(positionId);
        List<Position> positions = positionService.getAll();
        return Msg.success().add("positions",positions);
    }

    @RequestMapping("/admin_positionsDel")
    @ResponseBody
    public Msg admin_positionsDel(String positionIds){
        System.out.println(positionIds);
        String[] ids = positionIds.split(",");
        for (int i = 0;i<ids.length;i++){
            positionService.deletePosition(Integer.parseInt(ids[i]));
        }
        List<Position> positions = positionService.getAll();
        return Msg.success().add("positions",positions);
    }

    @RequestMapping("/search_position")
    @ResponseBody
    public Msg search_position(String searchName,String searchVal){
        List<Position> positions = positionService.searchPositions(searchName,searchVal);
        return Msg.success().add("positions",positions);
    }

    @RequestMapping(value = "/position_edit")
    public String position_edit(Integer positionId,Model model){
        List<MidClass> midClasses = midClassService.getAll();
        model.addAttribute("edit_position",positionService.getJobDetail(positionId));
        model.addAttribute("positionType",midClasses);
        return "/admin/position_edit";
    }

    @RequestMapping("/admin_updatePosition")
    @ResponseBody
    public Msg admin_updatePosition(Position position){
        positionService.updatePosition(position);
        return Msg.success();
    }

    @RequestMapping("/admin_jobClass")
    @ResponseBody
    public Msg admin_jobClass(){
        List<SmallClass> smallClasses = smallClassService.selectWithMid();
        MidClass midClass;
        for (int i=0; i<smallClasses.size();i++){
            midClass=midClassService.selectWithBig(smallClasses.get(i).getMidId());
            smallClasses.get(i).getMidClass().setBigClass(midClass.getBigClass());
        }
        return Msg.success().add("jobClass",smallClasses);
    }

    @RequestMapping("/admin_updateHot")
    @ResponseBody
    public Msg admin_updateHot(SmallClass smallClass){
        smallClassService.updateHot(smallClass);
        return Msg.success();
    }

    @RequestMapping("/admin_classDel")
    @ResponseBody
    public Msg admin_classDel(Integer smallId){
        smallClassService.delClass(smallId);
        return admin_jobClass();
    }

    @RequestMapping("/admin_classesDel")
    @ResponseBody
    public Msg admin_classesDel(String classIds){
        String[] ids = classIds.split(",");
        for (int i = 0;i<ids.length;i++){
            smallClassService.delClass(Integer.parseInt(ids[i]));
        }
        return admin_jobClass();
    }

    @RequestMapping("/smallClass_add")
    public String smallClass_add(Model model){
        List<BigClass> bigClasses = bigClassService.getAll();
        model.addAttribute("bigClasses",bigClasses);
        return "/admin/smallClass_add";
    }

    @RequestMapping("/selectMidClass")
    @ResponseBody
    public Msg selectMidClass(Integer bigId){
        List<MidClass> midClasses = midClassService.selectMidClass(bigId);
        return Msg.success().add("midClasses",midClasses);
    }

    @RequestMapping("/admin_addClass")
    @ResponseBody
    public Msg admin_addClass(SmallClass smallClass){
        smallClassService.addSmallClass(smallClass);
        return Msg.success();
    }

    @RequestMapping("/class_edit")
    public String class_edit(Integer smallId,Model model){
        SmallClass smallClass = smallClassService.selectClass(smallId);
        MidClass midClass = midClassService.selectWithBig(smallClass.getMidId());
        List<MidClass> midClasses = midClassService.selectMidClass(midClass.getBigId());
        List<BigClass> bigClasses = bigClassService.getAll();
        model.addAttribute("smallClass",smallClass);
        model.addAttribute("midClass",midClass);
        model.addAttribute("bigClasses",bigClasses);
        model.addAttribute("midClasses",midClasses);
        return "/admin/class_edit";
    }

    @RequestMapping("/admin_updateClass")
    @ResponseBody
    public Msg admin_updateClass(SmallClass smallClass){
        smallClassService.updateClass(smallClass);
        return Msg.success();
    }

    @RequestMapping("/admin_resumeList")
    @ResponseBody
    public Msg admin_resumeList(){
        List<Resume> resumes = resumeService.getAllResume();
        for (int i=0;i<resumes.size();i++){
            Emp emp = empService.getEmp(resumes.get(i).getEmpId());
            resumes.get(i).setEmp(emp);
        }
        return Msg.success().add("resumes",resumes);
    }

    @RequestMapping("/cheakResume")
    public String cheakResume(Integer resumeId,Model model){
        Resume resume = resumeService.getReceivedResume(resumeId);
        resume.setEmp(empService.getEmp(resume.getEmpId()));
        model.addAttribute("resume",resume);
        return "/admin/cheakResume";
    }

    @RequestMapping("/admin_resumeClean")
    @ResponseBody
    public Msg admin_resumeClean(Integer resumeId){
        resumeService.clearResume(resumeId);
        return Msg.success();
    }

    @RequestMapping("/search_resume")
    @ResponseBody
    public Msg search_resume(String empName){
        List<Emp> emps = empService.getEmpWithName(empName);
        List<Resume> resumes = new ArrayList<>();
        for (int i = 0;i < emps.size();i++){
            resumes.add(resumeService.getResume(emps.get(i).getEmpId()));
            resumes.get(i).setEmp(emps.get(i));
        }
        return Msg.success().add("resumes",resumes);
    }

    @RequestMapping("/toudi_list")
    public String toudi_list(){
        return "/admin/toudi_list";
    }

    public List<Toudi> searchList(List<Toudi> toudis){
        for (int i = 0;i<toudis.size();i++){
            toudis.get(i).setPosition(positionService.getJobDetail(toudis.get(i).getPositionId()));
            Resume resume = resumeService.getReceivedResume(toudis.get(i).getResumeId());
            resume.setEmp(empService.getEmp(resume.getEmpId()));
            toudis.get(i).setResume(resume);
        }
        return toudis;
    }

    @RequestMapping("/admin_toudiList")
    @ResponseBody
    public Msg admin_toudiList(){
        List<Toudi> toudis = toudiService.getToudis();
        return Msg.success().add("toudis",searchList(toudis));
    }

    @RequestMapping("/admin_searchToudi")
    @ResponseBody
    public Msg admin_searchToudi(Integer toudiType,String companyName){
        List<Toudi> toudis = toudiService.getToudisWithComp(toudiType,companyName);
        return Msg.success().add("toudis",searchList(toudis));
    }

    @RequestMapping("/admin_toudiUpdate")
    @ResponseBody
    public Msg admin_toudiUpdate(Toudi toudi){
        toudiService.updateInfo(toudi);
        return admin_toudiList();
    }

    @RequestMapping("/admin_toudiDel")
    @ResponseBody
    public Msg admin_toudiDel(Integer toudiId){
        toudiService.delToudi(toudiId);
        return admin_toudiList();
    }

    @RequestMapping("/question_list")
    public String question_list(){
        return "/admin/question_list";
    }

    @RequestMapping("/admin_questionList")
    @ResponseBody
    public Msg questionList(){
        List<Question> questions = questionService.getAllQuestion();
        for (int i = 0; i < questions.size(); i++){
            questions.get(i).setEmp(empService.getEmp(questions.get(i).getEmpId()));
        }
        return Msg.success().add("questions",questions);
    }

    @RequestMapping("/search_question")
    @ResponseBody
    public Msg search_question(String empName){
        List<Emp> emps = empService.getEmpWithName(empName);
        List<Question> questions = new ArrayList<>();
        for (int i = 0;i < emps.size();i++){
            List<Question> question = questionService.getQuestion(emps.get(i).getEmpId());
            for (int j = 0;j < question.size(); j++){
                question.get(j).setEmp(emps.get(i));
            }
            questions.addAll(question);
        }
        return Msg.success().add("questions",questions);
    }

    @RequestMapping("/question_edit")
    public String question_edit(Integer questionId,Model model){
        Question question = questionService.getQuestionWithId(questionId);
        question.setEmp(empService.getEmp(question.getEmpId()));
        model.addAttribute("question",question);
        return "admin/question_edit";
    }

    @RequestMapping("/admin_updateQuestion")
    @ResponseBody
    public Msg admin_updateQuestion(Question question){
        questionService.updateQuestion(question);
        return Msg.success();
    }

    @RequestMapping("/admin_questionDel")
    @ResponseBody
    public Msg admin_questionDel(Integer questionId){
        questionService.questionDel(questionId);
        return questionList();
    }

    @RequestMapping("/admin_questionsDel")
    @ResponseBody
    public Msg admin_questionsDel(String questionIds){
        String[] ids = questionIds.split(",");
        for (int i = 0;i < ids.length; i++){
            questionService.questionDel(Integer.valueOf(ids[i]));
        }
        return questionList();
    }

    @RequestMapping("/comment_list")
    public String comment_list(){
        return "admin/comment_list";
    }

    @RequestMapping("/admin_commentList")
    @ResponseBody
    public Msg admin_commentList(){
        List<Comment> comments = commentService.getAllComment();
        for (int i = 0; i < comments.size(); i++){
            comments.get(i).setEmp(empService.getEmp(comments.get(i).getEmpId()));
            comments.get(i).setQuestion(questionService.getQuestionWithId(comments.get(i).getQuestionId()));
        }
        return Msg.success().add("comments",comments);
    }

    @RequestMapping("/comment_edit")
    public String comment_edit(Integer commentId,Model model){
        Comment comment = commentService.getCommentWithId(commentId);
        comment.setEmp(empService.getEmp(comment.getEmpId()));
        comment.setQuestion(questionService.getQuestionWithId(comment.getQuestionId()));
        model.addAttribute("comment",comment);
        return "admin/comment_edit";
    }

    @RequestMapping("/admin_updateComment")
    @ResponseBody
    public Msg admin_updateComment(Comment comment){
        commentService.updateComment(comment);
        return Msg.success();
    }

    @RequestMapping("/admin_commentDel")
    @ResponseBody
    public Msg admin_commentDel(Integer commentId){
        commentService.delComment(commentId);
        return admin_commentList();
    }

    @RequestMapping("/admin_commentsDel")
    @ResponseBody
    public Msg admin_commentsDel(String commentIds){
        String[] ids = commentIds.split(",");
        for (int i = 0; i < ids.length; i++){
            commentService.delComment(Integer.valueOf(ids[i]));
        }
        return admin_commentList();
    }

    @RequestMapping("/collect_list")
    public String collect_list(){
        return "admin/collect_list";
    }

    @RequestMapping("/admin_collectList")
    @ResponseBody
    public Msg admin_collectList(){
        List<Collect> collects = collectService.getAllCollection();
        for (int i = 0; i < collects.size(); i++){
            collects.get(i).setEmp(empService.getEmp(collects.get(i).getEmpId()));
            collects.get(i).setPosition(positionService.getJobDetail(collects.get(i).getPositionId()));
        }
        return Msg.success().add("collection",collects);
    }

    @RequestMapping("/admin_collectDel")
    @ResponseBody
    public Msg admin_collectDel(Integer collectId){
        collectService.adminDelCollection(collectId);
        return admin_collectList();
    }

    @RequestMapping("/search_collection")
    @ResponseBody
    public Msg search_collection(String searchVal){
        if (searchVal.length() == 0){
            return admin_collectList();
        }
        List<Collect> collects = collectService.getCollectionWithCondition(searchVal);
        for (int i = 0; i < collects.size(); i++){
            collects.get(i).setEmp(empService.getEmp(collects.get(i).getEmpId()));
            collects.get(i).setPosition(positionService.getJobDetail(collects.get(i).getPositionId()));
        }
        return Msg.success().add("collection",collects);
    }

    @RequestMapping("/search_comment")
    @ResponseBody
    public Msg search_comment(String searchVal){
        if (searchVal.length() == 0){
            return admin_commentList();
        }
        List<Comment> comments = commentService.searchComments(searchVal);
        for (int i = 0; i < comments.size(); i++){
            comments.get(i).setEmp(empService.getEmp(comments.get(i).getEmpId()));
            comments.get(i).setQuestion(questionService.getQuestionWithId(comments.get(i).getQuestionId()));
        }
        return Msg.success().add("comments",comments);
    }

    @RequestMapping("/authentication_list")
    public String authentication_list(){
        return "admin/authentication_list";
    }

    @RequestMapping("/admin_authenticationList")
    @ResponseBody
    public Msg admin_authenticationList(){
        List<Authentication> authentications = authenticationService.getAllAuth();
        for (int i = 0; i < authentications.size(); i++){
            authentications.get(i).setCompany(companyService.getCompanyDetail(authentications.get(i).getCompanyId()));
        }
        return Msg.success().add("auths",authentications);
    }

    @RequestMapping("/isAuth")
    @ResponseBody
    public Msg isAuth(Authentication authentication,String type){
        String isAuth = authenticationService.updateAuth(authentication,type);
        return admin_authenticationList().add("isAuth",isAuth);
    }

    @ResponseBody
    @RequestMapping("/authAll")
    public Msg authAll(String authIds){
        String[] ids = authIds.split(",");
        for (int i = 0; i < ids.length; i++){
            Authentication authentication = authenticationService.getAuth(Integer.valueOf(ids[i]));
            authenticationService.updateAuth(authentication,"ok");
        }
        return admin_commentList();
    }

    @RequestMapping("/ad_list")
    public String ad_list(){
        return "admin/ad_list";
    }

    @RequestMapping("/admin_adList")
    @ResponseBody
    public Msg adList(){
        List<Ad> ads = adService.getAllAds();
        return Msg.success().add("ads",ads);
    }

    @RequestMapping("/ad_add")
    public String ad_add(){
        return "admin/ad_add";
    }

    @RequestMapping("/ad_upload")
    @ResponseBody
    public JSONObject ad_upload(MultipartFile file){
        JSONObject jsonObject = new JSONObject();
        String url = "";
        try {
            String realPath = "C:\\Users\\19653\\Desktop\\毕设\\campus_recruitment\\upload\\adImg";
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

            url = "http://localhost:8080/upload/adImg/"+newFilename;
            jsonObject.put("url",url);
            jsonObject.put("success",true);


            System.out.println("测试是否执行完毕");

        } catch (IOException e) {

            e.printStackTrace();

        }
        return jsonObject;
    }

    @RequestMapping("/admin_addAd")
    @ResponseBody
    public Msg admin_addAd(Ad ad){
        adService.addAd(ad);
        return Msg.success();
    }

    @RequestMapping("/admin_adOnline")
    @ResponseBody
    public Msg admin_adOnline(Ad ad){
        adService.updateAd(ad);
        return Msg.success();
    }

    @RequestMapping("/ad_edit")
    public String ad_edit(Integer adId,Model model){
        Ad ad = adService.getAd(adId);
        model.addAttribute("ad",ad);
        return "admin/ad_edit";
    }

    @RequestMapping("/admin_updateAd")
    @ResponseBody
    public Msg admin_updateAd(Ad ad){
        adService.updateAd(ad);
        return Msg.success();
    }

    @RequestMapping("/admin_updateCompany")
    @ResponseBody
    public Msg admin_updateCompany(Company company){
        companyService.updateCompanyInfo(company);
        return admin_companyList();
    }

}
