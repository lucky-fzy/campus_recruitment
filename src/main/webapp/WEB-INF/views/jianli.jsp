<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
    <script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <meta content="text/html;" charset="utf-8" http-equiv="Content-Type">
    <title>我的简历-校园招-最专业的大学生实习招聘平台</title>
    <link href="style/css/style.css" type="text/css" rel="stylesheet">
    <link href="style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="style/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="style/js/jquery.1.10.1.min.js" charset="utf-8"></script>
    <script src="style/js/jquery.lib.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="style/js/ajaxfileupload.js" charset="utf-8"></script>
    <script src="style/js/additional-methods.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a class="logo" href="home">
                <img width="229" height="43" alt="校园招-专注大学生实习招聘" src="style/images/logo.png">
            </a>
            <ul id="navheader" class="reset">
                <li><a href="home">首页</a></li>
                <li><a href="companylist">公司</a></li>
                <li><a target="_blank" href="yanzhi">言职</a></li>
                <li class="current"><a rel="nofollow" href="jianli">我的简历</a></li>
            </ul>
            <dl class="collapsible_menu">
                <dt>
                    <c:if test="${sessionScope.emp.empName == ''}">
                        <span>${sessionScope.emp.email}&nbsp;</span>
                    </c:if>
                    <span>${sessionScope.emp.empName}&nbsp;</span>
                    <span class="red dn" id="noticeDot-0"></span>
                    <i></i>
                </dt>
                <dd><a rel="nofollow" href="jianli">我的简历</a></dd>
                <dd><a href="collections">我收藏的职位</a></dd>
                <dd><a href="accountBind">帐号设置</a></dd>
                <dd class="logout"><a rel="nofollow" href="quit">退出</a></dd>
            </dl>
        </div>
    </div><!-- end #header -->
    <div id="container">

        <div class="clearfix">
            <div class="content_l">
                <div class="fl" id="resume_name">
                    <div class="nameShow fl">
                        <c:if test="${sessionScope.emp.empName == ''}">
                            <h1>我的简历</h1>
                        </c:if>
                        <c:if test="${sessionScope.emp.empName != ''}">
                            <h1>${sessionScope.emp.empName}的简历</h1>
                        </c:if>
                        <a target="_blank" href="preview">预览</a>
                    </div>
                </div><!--end #resume_name-->

                <div class="profile_box" id="basicInfo">
                    <h2>基本信息</h2>
                    <span class="c_edit"></span>
                    <div class="basicShow">
                        <span>${sessionScope.emp.empName} |  <c:if test="${sessionScope.emp.gender == 1}">男</c:if> <c:if test="${sessionScope.emp.gender == 0}">女</c:if> |   ${sessionScope.resume.degree}<br>
                            ${sessionScope.resume.phone} | ${sessionScope.emp.email}<br>
            			</span>
                        <div class="m_portrait">
                            <div></div>

                                <img width="120" height="120" alt="头像" src="${sessionScope.resume.photo}">

                        </div>
                    </div><!--end .basicShow-->

                    <div class="basicEdit dn">
                        <form id="profileForm" action="jianli.do" method="post">
                            <table>
                                <tbody>
                                <tr>
                                    <td valign="top">
                                        <span class="redstar">*</span>
                                    </td>
                                    <td>
                                        <input type="text" placeholder="姓名" value="${sessionScope.emp.empName}" name="name" id="name">
                                    </td>
                                    <td valign="top"></td>
                                    <td>
                                        <ul class="profile_radio clearfix reset">
                                            <c:if test="${sessionScope.emp.gender == 1}">
                                                <li class="current">
                                                    男<em></em>
                                                    <input type="radio" checked="checked" name="gender" value="男">
                                                </li>
                                                <li>
                                                    女<em></em>
                                                    <input type="radio" name="gender" value="女">
                                                </li>
                                            </c:if>
                                            <c:if test="${sessionScope.emp.gender == 0}">
                                                <li>
                                                    男<em></em>
                                                    <input type="radio" name="gender" value="男">
                                                </li>
                                                <li class="current">
                                                    女<em></em>
                                                    <input type="radio" checked="checked" name="gender" value="女">
                                                </li>
                                            </c:if>

                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <span class="redstar">*</span>
                                    </td>
                                    <td>
                                            <input type="hidden" id="topDegree" value="${sessionScope.resume.degree}" name="topDegree">
                                            <input type="button" value="${sessionScope.resume.degree}" id="select_topDegree"
                                                   class="profile_select_190 profile_select_normal">

                                        <div class="boxUpDown boxUpDown_190 dn" id="box_topDegree"
                                             style="display: none;">
                                            <ul>
                                                <li>大专</li>
                                                <li>本科</li>
                                                <li>硕士</li>
                                                <li>博士</li>
                                                <li>其他</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <span class="redstar">*</span>
                                    </td>
                                    <td colspan="3">
                                            <input type="text" placeholder="手机号码" value="${sessionScope.resume.phone}" name="tel" id="tel">

                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <span class="redstar">*</span>
                                    </td>
                                    <td colspan="3">
                                        <input type="text" placeholder="接收面试通知的邮箱" value="${sessionScope.emp.email}" name="email"
                                               id="email" disabled="disabled">
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="3">
                                        <input type="submit" value="保 存" class="btn_profile_save">
                                        <a class="btn_profile_cancel" href="javascript:;">取 消</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form><!--end #profileForm-->
                        <div class="new_portrait">
                            <div class="portrait_upload" id="portraitNo">
                                <span>上传自己的头像</span>
                            </div>
                            <div class="portraitShow dn" id="portraitShow">
                                <img width="120" height="120" src="">
                                <span>更换头像</span>
                            </div>
                            <input type="file" value="" title="支持jpg、jpeg、gif、png格式，文件小于5M"
                                   onchange="img_check(this,'upload_head','headPic');" name="headPic"
                                   id="headPic" class="myfiles">
                            <!-- <input type="hidden" id="headPicHidden" /> -->
                            <em>
                                尺寸：120*120px <br>
                                大小：小于5M
                            </em>
                            <span style="display:none;" id="headPic_error" class="error"></span>
                        </div><!--end .new_portrait-->
                    </div><!--end .basicEdit-->
                    <input type="hidden" id="nameVal" value="${sessionScope.emp.empName}">
                    <c:if test="${sessionScope.emp.gender == 1}">
                        <input type="hidden" id="genderVal" value="男">
                    </c:if>
                    <c:if test="${sessionScope.emp.gender == 0}">
                        <input type="hidden" id="genderVal" value="女">
                    </c:if>
                        <input type="hidden" id="topDegreeVal" value="${sessionScope.resume.degree}">
                        <input type="hidden" id="telVal" value="${sessionScope.resume.phone}">

                    <input type="hidden" id="emailVal" value="${sessionScope.emp.email}">
                    <input type="hidden" id="pageType" value="1">
                </div><!--end #basicInfo-->

                <div class="profile_box" id="expectJob">
                    <h2 style="display: inline">
                        期望工作
                    </h2>
                    <span style="font-size: 15px;font-weight:bold;margin-left: 100px">${sessionScope.resume.city}  |  ${sessionScope.resume.jobtype}  |  ${sessionScope.resume.position}  |  ${sessionScope.resume.salary}</span>
                    <span class="c_edit dn"></span>
                    <div class="expectShow dn">

                    </div><!--end .expectShow-->
                    <div class="expectEdit dn">
                        <form id="expectForm" action="addJob" method="post">
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <input type="hidden" id="expectCity" value="${sessionScope.resume.city}" name="expectCity">

                                            <input type="button" value="${sessionScope.resume.city}" id="select_expectCity"
                                                   class="profile_select_287 profile_select_normal">


                                        <div class="boxUpDown boxUpDown_596 dn" id="box_expectCity"
                                             style="display: none;">
                                            <dl>
                                                <dt>热门城市</dt>
                                                <dd>
                                                    <span>北京</span>
                                                    <span>上海</span>
                                                    <span>广州</span>
                                                    <span>深圳</span>
                                                    <span>成都</span>
                                                    <span>杭州</span>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>ABCDEF</dt>
                                                <dd>
                                                    <span>北京</span>
                                                    <span>长春</span>
                                                    <span>成都</span>
                                                    <span>重庆</span>
                                                    <span>长沙</span>
                                                    <span>常州</span>
                                                    <span>东莞</span>
                                                    <span>大连</span>
                                                    <span>佛山</span>
                                                    <span>福州</span>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>GHIJ</dt>
                                                <dd>
                                                    <span>贵阳</span>
                                                    <span>广州</span>
                                                    <span>哈尔滨</span>
                                                    <span>合肥</span>
                                                    <span>海口</span>
                                                    <span>杭州</span>
                                                    <span>惠州</span>
                                                    <span>金华</span>
                                                    <span>济南</span>
                                                    <span>嘉兴</span>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>KLMN</dt>
                                                <dd>
                                                    <span>昆明</span>
                                                    <span>廊坊</span>
                                                    <span>宁波</span>
                                                    <span>南昌</span>
                                                    <span>南京</span>
                                                    <span>南宁</span>
                                                    <span>南通</span>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>OPQR</dt>
                                                <dd>
                                                    <span>青岛</span>
                                                    <span>泉州</span>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>STUV</dt>
                                                <dd>
                                                    <span>上海</span>
                                                    <span>石家庄</span>
                                                    <span>绍兴</span>
                                                    <span>沈阳</span>
                                                    <span>深圳</span>
                                                    <span>苏州</span>
                                                    <span>天津</span>
                                                    <span>太原</span>
                                                    <span>台州</span>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>WXYZ</dt>
                                                <dd>
                                                    <span>武汉</span>
                                                    <span>无锡</span>
                                                    <span>温州</span>
                                                    <span>西安</span>
                                                    <span>厦门</span>
                                                    <span>烟台</span>
                                                    <span>珠海</span>
                                                    <span>中山</span>
                                                    <span>郑州</span>
                                                </dd>
                                            </dl>
                                        </div>
                                    </td>
                                    <td>
                                        <ul class="profile_radio clearfix reset">
                                            <c:if test="${sessionScope.resume.jobtype == '全职'}">
                                                <li class="current">
                                                    全职<em></em>
                                                    <input type="radio" checked="" name="type" value="全职">
                                                </li>
                                                <li>
                                                    实习<em></em>
                                                    <input type="radio" name="type" value="实习">
                                                </li>
                                            </c:if>
                                            <c:if test="${sessionScope.resume.jobtype != '全职'}">
                                                <li>
                                                    全职<em></em>
                                                    <input type="radio" name="type" value="全职">
                                                </li>
                                                <li class="current">
                                                    实习<em></em>
                                                    <input type="radio" checked="" name="type" value="实习">
                                                </li>
                                            </c:if>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" placeholder="期望职位，如：产品经理" value="${sessionScope.resume.position}" name="expectPosition"
                                               id="expectPosition">
                                    </td>
                                    <td>
                                        <input type="hidden" id="expectSalary" value="${sessionScope.resume.salary}" name="expectSalary">
                                        <input type="button" value="${sessionScope.resume.salary}" id="select_expectSalary"
                                               class="profile_select_287 profile_select_normal">
                                        <div class="boxUpDown boxUpDown_287 dn" id="box_expectSalary"
                                             style="display: none;">
                                            <ul>
                                                <li>2k以下</li>
                                                <li>2k-5k</li>
                                                <li>5k-10k</li>
                                                <li>10k-15k</li>
                                                <li>15k-25k</li>
                                                <li>25k以上</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="submit" value="保 存" class="btn_profile_save">
                                        <a class="btn_profile_cancel" href="javascript:;">取 消</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form><!--end #expectForm-->
                    </div><!--end .expectEdit-->
                    <div class="expectAdd pAdd">
                        填写准确的期望工作能大大提高求职成功率哦…<br>
                        快来添加期望工作吧！
                        <span>添加期望工作</span>
                    </div><!--end .expectAdd-->

                    <input type="hidden" id="expectJobVal" value="">
                    <input type="hidden" id="expectCityVal" value="">
                    <input type="hidden" id="typeVal" value="">
                    <input type="hidden" id="expectPositionVal" value="">
                    <input type="hidden" id="expectSalaryVal" value="">
                </div><!--end #expectJob-->



                <div class="profile_box" id="projectExperience">
                    <h2 style="display: inline">项目经验</h2>
                    <span style="font-size: 15px;font-weight:bold;margin-left: 100px">${sessionScope.resume.project}  |  ${sessionScope.resume.post}  |  ${sessionScope.resume.starttime}-${sessionScope.resume.endtime}</span>
                    <span class="c_add dn"></span>
                    <div class="projectShow dn">
                        <ul class="plist clearfix">
                        </ul>
                    </div><!--end .projectShow-->
                    <div class="projectEdit dn">
                        <form class="projectForm" action="addProject" method="post">
                            <table>
                                <tbody>
                                <tr>
                                    <td valign="top">
                                        <span class="redstar">*</span>
                                    </td>
                                    <td>
                                        <input type="text" placeholder="项目名称" value="${sessionScope.resume.project}" name="projectName" class="projectName">
                                    </td>
                                    <td valign="top">
                                        <span class="redstar">*</span>
                                    </td>
                                    <td>
                                        <input type="text" placeholder="担任职务，如：产品负责人" value="${sessionScope.resume.post}" name="thePost" class="thePost">
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <span class="redstar">*</span>
                                    </td>
                                    <td>
                                        <div class="fl">
                                            <input type="hidden" class="projectYearStart" value="${fn:substring(sessionScope.resume.starttime, 0, 4)}"
                                                   name="projectYearStart">
                                            <input type="button" value="开始年份"
                                                   class="profile_select_139 profile_select_normal select_projectYearStart">
                                            <div class="box_projectYearStart  boxUpDown boxUpDown_139 dn"
                                                 style="display: none;">
                                                <ul>
                                                    <li>2019</li>
                                                    <li>2018</li>
                                                    <li>2017</li>
                                                    <li>2016</li>
                                                    <li>2015</li>
                                                    <li>2014</li>
                                                    <li>2013</li>
                                                    <li>2012</li>
                                                    <li>2011</li>
                                                    <li>2010</li>
                                                    <li>2009</li>
                                                    <li>2008</li>
                                                    <li>2007</li>
                                                    <li>2006</li>
                                                    <li>2005</li>
                                                    <li>2004</li>
                                                    <li>2003</li>
                                                    <li>2002</li>
                                                    <li>2001</li>
                                                    <li>2000</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="fl">
                                            <input type="hidden" class="projectMonthStart" value="${fn:substring(sessionScope.resume.starttime,4,6)}"
                                                   name="projectMonthStart">
                                            <input type="button" value="开始月份"
                                                   class="profile_select_139 profile_select_normal select_projectMonthStart">
                                            <div style="display: none;"
                                                 class="box_projectMonthStart boxUpDown boxUpDown_139 dn">
                                                <ul>
                                                    <li>01</li>
                                                    <li>02</li>
                                                    <li>03</li>
                                                    <li>04</li>
                                                    <li>05</li>
                                                    <li>06</li>
                                                    <li>07</li>
                                                    <li>08</li>
                                                    <li>09</li>
                                                    <li>10</li>
                                                    <li>11</li>
                                                    <li>12</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                    </td>
                                    <td valign="top">
                                        <span class="redstar">*</span>
                                    </td>
                                    <td>
                                        <div class="fl">
                                            <input type="hidden" class="projectYearEnd" value="${fn:substring(sessionScope.resume.endtime,0,4)}" name="projectYearEnd">
                                            <input type="button" value="结束年份"
                                                   class="profile_select_139 profile_select_normal select_projectYearEnd">
                                            <div class="box_projectYearEnd  boxUpDown boxUpDown_139 dn"
                                                 style="display: none;">
                                                <ul>
                                                    <li>至今</li>
                                                    <li>2019</li>
                                                    <li>2018</li>
                                                    <li>2017</li>
                                                    <li>2016</li>
                                                    <li>2015</li>
                                                    <li>2014</li>
                                                    <li>2013</li>
                                                    <li>2012</li>
                                                    <li>2011</li>
                                                    <li>2010</li>
                                                    <li>2009</li>
                                                    <li>2008</li>
                                                    <li>2007</li>
                                                    <li>2006</li>
                                                    <li>2005</li>
                                                    <li>2004</li>
                                                    <li>2003</li>
                                                    <li>2002</li>
                                                    <li>2001</li>
                                                    <li>2000</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="fl">
                                            <input type="hidden" class="projectMonthEnd" value="${fn:substring(sessionScope.resume.endtime,4,6)}"
                                                   name="projectMonthEnd">
                                            <input type="button" value="结束月份"
                                                   class="profile_select_139 profile_select_normal select_projectMonthEnd">
                                            <div style="display: none;"
                                                 class="box_projectMonthEnd boxUpDown boxUpDown_139 dn">
                                                <ul>
                                                    <li>01</li>
                                                    <li>02</li>
                                                    <li>03</li>
                                                    <li>04</li>
                                                    <li>05</li>
                                                    <li>06</li>
                                                    <li>07</li>
                                                    <li>08</li>
                                                    <li>09</li>
                                                    <li>10</li>
                                                    <li>11</li>
                                                    <li>12</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top"></td>
                                    <td colspan="3">
                                        <textarea class="projectDescription s_textarea" name="projectDescription"
                                                  placeholder="项目描述"></textarea>
                                        <div class="word_count">你还可以输入 <span>500</span> 字</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top"></td>
                                    <td colspan="3">
                                        <input type="submit" value="保 存" class="btn_profile_save">
                                        <a class="btn_profile_cancel" href="javascript:;">取 消</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <input type="hidden" value="" class="projectId">
                        </form><!--end .projectForm-->
                    </div><!--end .projectEdit-->
                    <div class="projectAdd pAdd">
                        项目经验是用人单位衡量人才能力的重要指标哦！<br>
                        来说说让你难忘的项目吧！
                        <span>添加项目经验</span>
                    </div><!--end .projectAdd-->
                </div><!--end #projectExperience-->

                <div class="profile_box" id="educationalBackground">
                    <h2 style="display: inline">教育背景</h2>
                    <span style="font-size: 15px;font-weight:bold;margin-left: 100px">${sessionScope.emp.school}  |  ${sessionScope.resume.degree}  |  ${sessionScope.resume.major}</span>
                    <span class="c_add dn"></span>

                    <div class="educationalEdit dn">
                        <form class="educationalForm" method="post" action="addEdu">
                            <table>
                                <tbody>
                                <tr>
                                    <td valign="top">
                                        <span class="redstar">*</span>
                                    </td>
                                    <td>
                                        <input type="text" placeholder="学校名称" name="schoolName" class="schoolName">
                                    </td>
                                    <td valign="top">
                                        <span class="redstar">*</span>
                                    </td>
                                    <td>
                                        <input type="hidden" class="degree" value="" name="degree">
                                        <input type="button" value="学历"
                                               class="profile_select_287 profile_select_normal select_degree">
                                        <div class="box_degree boxUpDown boxUpDown_287 dn" style="display: none;">
                                            <ul>
                                                <li>大专</li>
                                                <li>本科</li>
                                                <li>硕士</li>
                                                <li>博士</li>
                                                <li>其他</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <span class="redstar">*</span>
                                    </td>
                                    <td>
                                        <input type="text" placeholder="专业名称" name="professionalName"
                                               class="professionalName">
                                    </td>
                                    <td valign="top">
                                        <span class="redstar">*</span>
                                    </td>
                                    <td>
                                        <div class="fl">
                                            <input type="hidden" class="schoolYearStart" value=""
                                                   name="schoolYearStart">
                                            <input type="button" value="开始年份"
                                                   class="profile_select_139 profile_select_normal select_schoolYearStart">
                                            <div class="box_schoolYearStart boxUpDown boxUpDown_139 dn"
                                                 style="display: none;">
                                                <ul>
                                                    <li>2019</li>
                                                    <li>2018</li>
                                                    <li>2017</li>
                                                    <li>2016</li>
                                                    <li>2015</li>
                                                    <li>2014</li>
                                                    <li>2013</li>
                                                    <li>2012</li>
                                                    <li>2011</li>
                                                    <li>2010</li>
                                                    <li>2009</li>
                                                    <li>2008</li>
                                                    <li>2007</li>
                                                    <li>2006</li>
                                                    <li>2005</li>
                                                    <li>2004</li>
                                                    <li>2003</li>
                                                    <li>2002</li>
                                                    <li>2001</li>
                                                    <li>2000</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="fl">
                                            <input type="hidden" class="schoolYearEnd" value="" name="schoolYearEnd">
                                            <input type="button" value="结束年份"
                                                   class="profile_select_139 profile_select_normal select_schoolYearEnd">
                                            <div class="box_schoolYearEnd  boxUpDown boxUpDown_139 dn"
                                                 style="display: none;">
                                                <ul>
                                                    <li>2022</li>
                                                    <li>2021</li>
                                                    <li>2020</li>
                                                    <li>2019</li>
                                                    <li>2018</li>
                                                    <li>2017</li>
                                                    <li>2016</li>
                                                    <li>2015</li>
                                                    <li>2014</li>
                                                    <li>2013</li>
                                                    <li>2012</li>
                                                    <li>2011</li>
                                                    <li>2010</li>
                                                    <li>2009</li>
                                                    <li>2008</li>
                                                    <li>2007</li>
                                                    <li>2006</li>
                                                    <li>2005</li>
                                                    <li>2004</li>
                                                    <li>2003</li>
                                                    <li>2002</li>
                                                    <li>2001</li>
                                                    <li>2000</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="clear"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="3">
                                        <input type="submit" value="保 存" class="btn_profile_save">
                                        <a class="btn_profile_cancel" href="javascript:;">取 消</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <input type="hidden" class="eduId" value="">
                        </form><!--end .educationalForm-->
                    </div><!--end .educationalEdit-->
                    <div class="educationalAdd pAdd">
                        教育背景可以充分体现你的学习和专业能力，<br>
                        且完善后才可投递简历哦！
                        <span>添加教育经历</span>
                    </div><!--end .educationalAdd-->
                </div><!--end #educationalBackground-->

                <div class="profile_box" id="selfDescription">
                    <h2 >自我描述</h2>
                    <span style="font-size: 15px;font-weight:bold;">${sessionScope.resume.selfdescribe}</span>
                    <span class="c_edit dn"></span>
                    <div class="descriptionShow dn">

                    </div><!--end .descriptionShow-->
                    <div class="descriptionEdit dn">
                        <form class="descriptionForm" action="addSelfDescription">
                            <table>
                                <tbody>
                                <tr>
                                    <td colspan="2">
                                        <textarea class="selfDescription s_textarea" name="selfDescription"
                                                  placeholder=""></textarea>
                                        <div class="word_count">你还可以输入 <span>500</span> 字</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="submit" value="保 存" class="btn_profile_save">
                                        <a class="btn_profile_cancel" href="javascript:;">取 消</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form><!--end .descriptionForm-->
                    </div><!--end .descriptionEdit-->
                    <div class="descriptionAdd pAdd">
                        描述你的性格、爱好以及吸引人的经历等，<br>
                        让企业了解多元化的你！
                        <span>添加自我描述</span>
                    </div><!--end .descriptionAdd-->
                </div><!--end #selfDescription-->
            </div><!--end .content_l-->
            <div class="content_r" style="margin-top: 35px">
                <div class="mycenterR" id="myInfo">
                    <h2>我的信息</h2>
                    <a href="collections">我收藏的职位</a><br>
                    <a href="delivery?type=-1">已投递简历状态</a>
                </div><!--end #myInfo-->

                <div class="greybg qrcode mt20">
                    <img width="242" height="242" alt="拉勾微信公众号二维码" src="style/images/qr_resume.png">
                    <span class="c7">微信扫一扫，轻松找工作</span>
                </div>
            </div><!--end .content_r-->
        </div>

        <input type="hidden" id="userid" name="userid" value="314873">

        <!------------------------------------- end ----------------------------------------->

        <script src="style/js/Chart.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="style/js/profile.min.js" type="text/javascript" charset="utf-8"></script>
        <!-- <div id="profileOverlay"></div> -->
        <div class="" id="qr_cloud_resume" style="display: none;">
            <div class="cloud">
                <img width="134" height="134" src="">
                <a class="close" href="javascript:;"></a>
            </div>
        </div>

        <div class="clear"></div>
        <input type="hidden" value="97fd449bcb294153a671f8fe6f4ba655" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
    </div><!-- end #container -->
</div><!-- end #body -->
<div id="footer">
    <div class="wrapper">
        <a rel="nofollow" target="_blank" href="h/about.html">联系我们</a>
        <a target="_blank" href="h/af/zhaopin.html">互联网公司导航</a>
    </div>
</div>

<script src="style/js/core.min.js" type="text/javascript" charset="utf-8"></script>
<script src="style/js/popup.min.js" type="text/javascript" charset="utf-8"></script>

<!--  -->

</body>
</html>