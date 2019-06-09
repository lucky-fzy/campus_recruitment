<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
    <script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <meta content="text/html;" charset="utf-8" http-equiv="Content-Type">
    <c:if test="${createOrUpdate == 'create'}">
        <title>发布新职位-校园招-最专业的大学生实习招聘平台</title>
    </c:if>
    <c:if test="${createOrUpdate == 'update'}">
        <title>编辑职位-校园招-最专业的大学生实习招聘平台</title>
    </c:if>
    <link href="style/css/style.css" type="text/css" rel="stylesheet">
    <link href="style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="style/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
    <script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
    <script src="style/js/additional-methods.js" type="text/javascript"></script>
    <script src="style/js/conv.js" type="text/javascript"></script>
</head>
<body>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a class="logo" href="index.jsp">
                <img width="229" height="43" alt="校园招-专注大学生实习招聘" src="style/images/logo.png">
            </a>
            <ul id="navheader" class="reset">
                <li><a href="home">首页</a></li>
                <li><a href="companylist">公司</a></li>
                <li><a target="_blank" href="yanzhi">言职</a></li>
                <li class="current"><a rel="nofollow" href="create">招聘管理</a></li>
            </ul>
            <dl class="collapsible_menu">
                <dt>
                    <span>个人中心&nbsp;</span>
                    <i></i>
                </dt>
                <dd style="display: none;"><a href="javascript:post('positions',{isOnline:1})">我发布的职位</a></dd>
                <dd style="display: none;"><a href="javascript:post('select_Resumes',{type:0})">我收到的简历</a></dd>
                <dd class="btm" style="display: none;"><a href="myhome">我的公司主页</a></dd>
                <dd style="display: none;"><a href="accountBind">帐号设置</a></dd>
                <dd class="logout" style="display: none;"><a rel="nofollow" href="quit">退出</a></dd>
            </dl>
        </div>
    </div><!-- end #header -->
    <div id="container">

        <div class="sidebar">
            <a class="btn_create" href="create">发布新职位</a>
            <dl class="company_center_aside">
                <dt>我收到的简历</dt>
                <dd>
                    <a href="javascript:post('select_Resumes',{type:0})">待处理简历</a>
                </dd>
                <dd>
                    <a href="javascript:post('select_Resumes',{type:3})">待定简历</a>
                </dd>
                <dd>
                    <a href="javascript:post('select_Resumes',{type:1})">已通知面试简历</a>
                </dd>
                <dd>
                    <a href="javascript:post('select_Resumes',{type:2})">不合适简历</a>
                </dd>
            </dl>
            <dl class="company_center_aside">
                <dt>我发布的职位</dt>
                <dd>
                    <a href="javascript:post('positions',{isOnline:1})">有效职位</a>
                </dd>
                <dd>
                    <a href="javascript:post('positions',{isOnline:0})">已下线职位</a>
                </dd>
            </dl>
            <div class="subscribe_side mt20">
                <div class="f14">想收到更多更好的简历？</div>
                <div class="f18 mb10">就用招聘加速助手</div>
                <div>咨询：<a class="f16" href="">jessica@xyz.com</a></div>
                <div class="f18 ti2em">010-57286512</div>
            </div>
            <div class="subscribe_side mt20">
                <div class="f14">加入互联网HR交流群</div>
                <div class="f18 mb10">跟同行聊聊</div>
                <div class="f24">338167634</div>
            </div>
        </div><!-- end .sidebar -->
        <div class="content">
            <dl class="company_center_content">
                <dt>
                    <h1>
                        <em></em>
                        <c:if test="${createOrUpdate == 'create'}">
                            发布新职位
                        </c:if>
                        <c:if test="${createOrUpdate == 'update'}">
                            修改职位
                        </c:if>
                    </h1>
                </dt>
                <dd>
                    <form action="createPosition" method="post" id="jobForm">
                        <input type="hidden" value="" name="id">
                        <input type="hidden" value="create" name="preview">
                        <c:if test="${createOrUpdate == 'update'}">
                            <input type="hidden" value="${positionDetail.positionId}" name="positionId" id="positionId">
                        </c:if>
                        <table class="btm">
                            <tbody>
                            <tr>
                                <td width="25"><span class="redstar">*</span></td>
                                <td width="85">职位类别</td>
                                <td>
                                    <c:if test="${createOrUpdate == 'create'}">
                                        <input type="hidden" id="positionType" value="" name="positionType">
                                        <input type="button" value="请选择职位类别" id="select_category"
                                               class="selectr selectr_380">
                                    </c:if>
                                    <c:if test="${createOrUpdate == 'update'}">
                                        <input type="hidden" id="positionType" value="${positionDetail.positionType}"
                                               name="positionType">
                                        <input type="button" value="${positionDetail.positionType}" id="select_category"
                                               class="selectr selectr_380">
                                    </c:if>
                                    <div class="dn" id="box_job" style="display: none;">
                                        <c:forEach items="${sessionScope.bigJob}" var="big">
                                            <dl>
                                                <dt>${big.bigName}</dt>
                                                <dd>
                                                    <ul class="reset job_main">
                                                        <c:forEach items="${sessionScope.midJob}" var="mid">
                                                            <c:if test="${mid.bigId == big.bigId}">
                                                                <li>
                                                                    <span>${mid.midName}</span>
                                                                    <ul class="reset job_sub dn">
                                                                        <c:forEach items="${sessionScope.smallJob}"
                                                                                   var="small">
                                                                            <c:if test="${small.midId == mid.midId}">
                                                                                <li>${small.smallName}</li>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </li>
                                                            </c:if>
                                                        </c:forEach>
                                                    </ul>
                                                </dd>
                                            </dl>
                                        </c:forEach>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="redstar">*</span></td>
                                <td>职位名称</td>
                                <td>
                                    <c:if test="${createOrUpdate == 'update'}">
                                        <input type="text" placeholder="请输入职位名称，如：产品经理"
                                               value="${positionDetail.positionName}" name="positionName"
                                               id="positionName">
                                    </c:if>
                                    <c:if test="${createOrUpdate == 'create'}">
                                        <input type="text" placeholder="请输入职位名称，如：产品经理" value="" name="positionName"
                                               id="positionName">
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>所属部门</td>
                                <td>
                                    <c:if test="${createOrUpdate == 'update'}">
                                        <input type="text" placeholder="请输入所属部门" value="${positionDetail.department}"
                                               name="department" id="department">
                                    </c:if>
                                    <c:if test="${createOrUpdate == 'create'}">
                                        <input type="text" placeholder="请输入所属部门" value="" name="department"
                                               id="department">
                                    </c:if>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <table class="btm">
                            <tbody>
                            <tr>
                                <td width="25"><span class="redstar">*</span></td>
                                <td width="85">工作性质</td>
                                <td>
                                    <ul class="profile_radio clearfix reset">
                                        <c:if test="${createOrUpdate == 'create'}">
                                            <li>
                                                全职<em></em>
                                                <input type="radio" name="jobNature" value="全职">
                                            </li>
                                            <li>
                                                实习<em></em>
                                                <input type="radio" name="jobNature" value="实习">
                                            </li>
                                        </c:if>
                                        <c:if test="${createOrUpdate == 'update'}">
                                            <c:if test="${positionDetail.jobType == '全职'}">
                                                <li class="current">
                                                    全职<em></em>
                                                    <input type="radio" name="jobNature" value="全职" checked class="valid">
                                                </li>
                                                <li>
                                                    实习<em></em>
                                                    <input type="radio" name="jobNature" value="实习">
                                                </li>
                                            </c:if>
                                            <c:if test="${positionDetail.jobType == '实习'}">
                                                <li>
                                                    全职<em></em>
                                                    <input type="radio" name="jobNature" value="全职" checked>
                                                </li>
                                                <li class="current">
                                                    实习<em></em>
                                                    <input type="radio" name="jobNature" value="实习" checked class="valid">
                                                </li>
                                            </c:if>
                                        </c:if>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="redstar">*</span></td>
                                <td>月薪范围</td>
                                <td>
                                    <div class="salary_range">
                                        <div>
                                            <c:if test="${createOrUpdate == 'create'}">
                                                <input type="text" placeholder="最低月薪" value="" id="salaryMin"
                                                       name="salaryMin" oninput="value=value.replace(/[^\d]/g,'')">
                                            </c:if>
                                            <c:if test="${createOrUpdate == 'update'}">
                                                <input type="text" placeholder="最低月薪"
                                                       value="${positionDetail.minSalary}" id="salaryMin"
                                                       name="salaryMin" oninput="value=value.replace(/[^\d]/g,'')">
                                            </c:if>
                                            <span>k</span>
                                        </div>
                                        <div>
                                            <c:if test="${createOrUpdate == 'create'}">
                                                <input type="text" placeholder="最高月薪" value="" id="salaryMax"
                                                       name="salaryMax" oninput="value=value.replace(/[^\d]/g,'')">
                                            </c:if>
                                            <c:if test="${createOrUpdate == 'update'}">
                                                <input type="text" placeholder="最高月薪"
                                                       value="${positionDetail.maxSalary}" id="salaryMax"
                                                       name="salaryMax" oninput="value=value.replace(/[^\d]/g,'')">
                                            </c:if>
                                            <span>k</span>
                                        </div>
                                        <span>只能输入整数，如：9</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="redstar">*</span></td>
                                <td>工作城市</td>
                                <td>
                                    <c:if test="${createOrUpdate == 'create'}">
                                        <input type="text" placeholder="请输入工作城市，如：北京" name="workAddress"
                                               id="workAddress">
                                    </c:if>
                                    <c:if test="${createOrUpdate == 'update'}">
                                        <input type="text" placeholder="请输入工作城市，如：北京" name="workAddress"
                                               id="workAddress" value="${positionDetail.jobCity}">
                                    </c:if>

                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <table class="btm">
                            <tbody>
                            <tr>
                                <td width="25"><span class="redstar">*</span></td>
                                <td width="85">工作经验</td>
                                <td>
                                    <c:if test="${createOrUpdate == 'create'}">
                                        <input type="hidden" id="experience" value="" name="workYear">
                                        <input type="button" value="请选择工作经验" id="select_experience"
                                               class="selectr selectr_380" name="experience">
                                    </c:if>
                                    <c:if test="${createOrUpdate == 'update'}">
                                        <input type="hidden" id="experience" value="${positionDetail.jobExperience}"
                                               name="workYear">
                                        <input type="button" value="${positionDetail.jobExperience}"
                                               id="select_experience"
                                               class="selectr selectr_380" name="experience">
                                    </c:if>

                                    <div class="boxUpDown boxUpDown_380 dn" id="box_experience" style="display: none;">
                                        <ul>
                                            <li>
                                                不限
                                            </li>
                                            <li>
                                                应届毕业生
                                            </li>
                                            <li>
                                                1年以下
                                            </li>
                                            <li>
                                                1-3年
                                            </li>
                                            <li>
                                                3-5年
                                            </li>
                                            <li>
                                                5年以上
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="redstar">*</span></td>
                                <td>学历要求</td>
                                <td>
                                    <c:if test="${createOrUpdate == 'create'}">
                                        <input type="hidden" id="education" value="" name="education">
                                        <input type="button" value="请选择学历要求" id="select_education"
                                               class="selectr selectr_380" name="degree">
                                    </c:if>
                                    <c:if test="${createOrUpdate == 'update'}">
                                        <input type="hidden" id="education" value="${positionDetail.degree}"
                                               name="education">
                                        <input type="button" value="${positionDetail.degree}" id="select_education"
                                               class="selectr selectr_380" name="degree">
                                    </c:if>
                                    <div class="boxUpDown boxUpDown_380 dn" id="box_education" style="display: none;">
                                        <ul>
                                            <li>
                                                不限
                                            </li>
                                            <li>
                                                大专
                                            </li>
                                            <li>
                                                本科
                                            </li>
                                            <li>
                                                硕士
                                            </li>
                                            <li>
                                                博士
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <table class="btm">
                            <tbody>
                            <tr>
                                <td width="25"><span class="redstar">*</span></td>
                                <td width="85">职位诱惑</td>
                                <td>
                                    <c:if test="${createOrUpdate == 'create'}">
                                        <input type="text" placeholder="20字描述该职位的吸引力，如：福利待遇、发展前景等" value=""
                                               name="positionAdvantage" class="input_520" id="positionAdvantage">
                                    </c:if>
                                    <c:if test="${createOrUpdate == 'update'}">
                                        <input type="text" placeholder="20字描述该职位的吸引力，如：福利待遇、发展前景等"
                                               value="${positionDetail.positionTemptation}"
                                               name="positionAdvantage" class="input_520" id="positionAdvantage">
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="redstar">*</span></td>
                                <td>职位描述</td>
                                <td>
                                    <span class="c9 f14">(建议分条描述工作职责等)</span>
                                    <c:if test="${createOrUpdate == 'create'}">
                                        <textarea name="positionDetail" id="positionDetail"></textarea>
                                    </c:if>
                                    <c:if test="${createOrUpdate == 'update'}">
                                        <textarea name="positionDetail"
                                                  id="positionDetail">${positionDetail.positionDescribe}</textarea>
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="redstar">*</span></td>
                                <td>工作地址</td>
                                <td>
                                    <c:if test="${createOrUpdate == 'create'}">
                                        <input type="text" placeholder="请输入详细的工作地址" value="" name="positionAddress"
                                               class="input_520" id="positionAddress">
                                    </c:if>
                                    <c:if test="${createOrUpdate == 'update'}">
                                        <input type="text" placeholder="请输入详细的工作地址" value="${positionDetail.jobAddr}"
                                               name="positionAddress"
                                               class="input_520" id="positionAddress">
                                    </c:if>
                                    <div class="work_place f14">我们将在职位详情页以地图方式精准呈现给用户 <a id="mapPreview"
                                                                                         href="javascript:;">预览地图</a>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <table>
                            <tbody>
                            <tr>
                                <td width="25"><span class="redstar">*</span></td>
                                <td colspan="2">
                                    接收简历邮箱： <span id="receiveEmailVal">${sessionScope.company.receiveEmail}</span>
                                    <input type="hidden" value="${sessionScope.company.receiveEmail}" id="receiveEmail"
                                           name="email">
                                </td>
                            </tr>
                            <tr>
                                <td width="25"></td>
                                <td colspan="2">
                                    <c:if test="${createOrUpdate == 'create'}">
                                        <input type="hidden" value="create" name="createOrUpdate" id="createOrUpdate">
                                        <input style="margin-left: 40%" align="center" type="button" value="发布" id="formSubmit" class="btn_32">
                                    </c:if>
                                    <c:if test="${createOrUpdate == 'update'}">
                                        <input type="hidden" value="update" name="createOrUpdate"id="createOrUpdate">
                                        <input style="margin-left: 40%" type="button" value="修改" id="formSubmit" class="btn_32">
                                    </c:if>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </dd>
            </dl>
        </div><!-- end .content -->

        <!------------------------------------- 弹窗lightbox ----------------------------------------->
        <div style="display:none;">
            <!--地图弹窗-->
            <div class="popup" id="baiduMap">
                <div class="mb10">点击地图可重新定位公司所在的位置</div>
                <div id="allmap"
                     style="overflow: hidden; position: relative; z-index: 0; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;">
                    <div style="overflow: visible; position: absolute; z-index: 0; left: 0px; top: 0px; cursor: grab;">
                        <div class="BMap_mask"
                             style="position: absolute; left: 0px; top: 0px; z-index: 9; overflow: hidden; width: 0px; height: 0px;"></div>
                        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;">
                            <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;"></div>
                            <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;"></div>
                            <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;"></div>
                            <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;">
                                <label class="BMapLabel" unselectable="on"
                                       style="position: absolute; -moz-user-select: none; display: none; cursor: inherit; background-color: rgb(190, 190, 190); border: 1px solid rgb(190, 190, 190); padding: 1px; white-space: nowrap; font: 12px arial,simsun,sans-serif; z-index: -20000; color: rgb(190, 190, 190);">shadow</label>
                            </div>
                            <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;"></div>
                            <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 300;"></div>
                            <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 201;"></div>
                            <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"></div>
                        </div>
                        <div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 1;">
                            <div style="position: absolute; overflow: visible; z-index: -100; left: 0px; top: 0px; display: none;"></div>
                        </div>
                        <div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 2; display: block;">
                            <div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 0; display: block;">
                                <canvas style="position: absolute; width: 256px; height: 256px; left: -74px; top: -213px; background: none repeat scroll 0% 0% rgb(243, 241, 236);"
                                        width="256" height="256" id="_1_bg_6323_2355_15"></canvas>
                            </div>
                            <div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 10; display: block;">
                                <canvas style="position: absolute; width: 256px; height: 256px; left: -74px; top: -213px;"
                                        width="256" height="256" id="_1_poi_6323_2355_15"></canvas>
                            </div>
                        </div>
                        <div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 3;"></div>
                    </div>
                    <div style="position: absolute; z-index: 1201; top: 10px; right: 10px; width: 17px; height: 16px; background:  no-repeat scroll 0% 0% transparent; cursor: pointer; display: none;"
                         title="退出全景"></div>
                    <div style="height: 32px; position: absolute; z-index: 30; -moz-user-select: none; bottom: 0px; right: auto; top: auto; left: 1px; display: none;"
                         class=" anchorBL"><a title="到百度地图查看此区域" target="_blank" href="http://map.baidu.com/?sr=1"
                                              style="outline: medium none;"><img src="style/images/copyright_logo.png"
                                                                                 style="border:none;width:77px;height:32px"></a>
                    </div>
                    <div style="position:absolute;z-index:0;top:0px;left:0px;overflow:hidden;visibility:hidden;cursor:-moz-grab"
                         id="zoomer">
                        <div style="top:0;left:0;" class="BMap_zoomer"></div>
                        <div style="top:0;right:0;" class="BMap_zoomer"></div>
                        <div style="bottom:0;left:0;" class="BMap_zoomer"></div>
                        <div style="bottom:0;right:0;" class="BMap_zoomer"></div>
                    </div>
                    <div unselectable="on" class=" BMap_stdMpCtrl BMap_stdMpType0 BMap_noprint anchorTL"
                         style="width: 62px; height: 186px; bottom: auto; right: auto; top: 10px; left: 10px; position: absolute; z-index: 1100; -moz-user-select: none;">
                        <div class="BMap_stdMpPan">
                            <div title="向上平移" class="BMap_button BMap_panN"></div>
                            <div title="向左平移" class="BMap_button BMap_panW"></div>
                            <div title="向右平移" class="BMap_button BMap_panE"></div>
                            <div title="向下平移" class="BMap_button BMap_panS"></div>
                            <div class="BMap_stdMpPanBg BMap_smcbg"></div>
                        </div>
                        <div class="BMap_stdMpZoom" style="height: 141px; width: 62px;">
                            <div title="放大一级" class="BMap_button BMap_stdMpZoomIn">
                                <div class="BMap_smcbg"></div>
                            </div>
                            <div title="缩小一级" class="BMap_button BMap_stdMpZoomOut" style="top: 120px;">
                                <div class="BMap_smcbg"></div>
                            </div>
                            <div class="BMap_stdMpSlider" style="height: 102px;">
                                <div class="BMap_stdMpSliderBgTop" style="height: 102px;">
                                    <div class="BMap_smcbg"></div>
                                </div>
                                <div class="BMap_stdMpSliderBgBot" style="top: 19px; height: 87px;"></div>
                                <div title="放置到此级别" class="BMap_stdMpSliderMask"></div>
                                <div title="拖动缩放" class="BMap_stdMpSliderBar" style="cursor: grab; top: 19px;">
                                    <div class="BMap_smcbg"></div>
                                </div>
                            </div>
                            <div class="BMap_zlHolder">
                                <div class="BMap_zlSt">
                                    <div class="BMap_smcbg"></div>
                                </div>
                                <div class="BMap_zlCity">
                                    <div class="BMap_smcbg"></div>
                                </div>
                                <div class="BMap_zlProv">
                                    <div class="BMap_smcbg"></div>
                                </div>
                                <div class="BMap_zlCountry">
                                    <div class="BMap_smcbg"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div unselectable="on"
                         style="bottom: auto; right: 10px; top: 10px; left: auto; white-space: nowrap; cursor: pointer; position: absolute; z-index: 10; -moz-user-select: none;"
                         class=" BMap_noprint anchorTR">
                        <div style="-moz-user-select: none; float: left;">
                            <div style="-moz-user-select: none; box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.35); border-left: 1px solid rgb(139, 164, 220); border-top: 1px solid rgb(139, 164, 220); border-bottom: 1px solid rgb(139, 164, 220); background: none repeat scroll 0% 0% rgb(142, 168, 224); padding: 2px 6px; font: bold 12px/1.3em arial,simsun,sans-serif; text-align: center; white-space: nowrap; border-radius: 3px 0px 0px 3px; color: rgb(255, 255, 255);"
                                 title="显示普通地图">地图
                            </div>
                        </div>
                        <div style="-moz-user-select: none; float: left;">
                            <div style="-moz-user-select: none; box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.35); border-left: 1px solid rgb(139, 164, 220); border-top: 1px solid rgb(139, 164, 220); border-bottom: 1px solid rgb(139, 164, 220); background: none repeat scroll 0% 0% rgb(255, 255, 255); padding: 2px 6px; font-family: arial,simsun,sans-serif; font-style: normal; font-variant: normal; font-size: 12px; line-height: 1.3em; font-size-adjust: none; font-stretch: normal; -moz-font-feature-settings: normal; -moz-font-language-override: normal; text-align: center; white-space: nowrap; color: rgb(0, 0, 0);"
                                 title="显示卫星影像">卫星
                            </div>
                            <div style="-moz-user-select: none; position: absolute; top: 0px; left: 0px; z-index: -1; display: none;">
                                <div style="border-right:1px solid #8ba4dc;border-bottom:1px solid #8ba4dc;border-left:1px solid #8ba4dc;background:white;font:12px arial,simsun,sans-serif;padding:0 8px 0 6px;line-height:1.6em;box-shadow:2px 2px 3px rgba(0, 0, 0, 0.35)"
                                     title="显示带有街道的卫星影像"><span class="BMap_checkbox" checked="checked"></span>
                                    <label style="vertical-align: middle; cursor: pointer;">混合</label></div>
                            </div>
                        </div>
                        <div style="-moz-user-select: none; float: left;">
                            <div style="-moz-user-select: none; box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.35); border-left: 1px solid rgb(139, 164, 220); border-width: 1px; border-style: solid; border-color: rgb(139, 164, 220); background: none repeat scroll 0% 0% rgb(255, 255, 255); padding: 2px 6px; font-family: arial,simsun,sans-serif; font-style: normal; font-variant: normal; font-size: 12px; line-height: 1.3em; font-size-adjust: none; font-stretch: normal; -moz-font-feature-settings: normal; -moz-font-language-override: normal; text-align: center; white-space: nowrap; border-radius: 0px 3px 3px 0px; color: rgb(0, 0, 0);"
                                 title="显示三维地图">三维
                            </div>
                        </div>
                    </div>
                    <div unselectable="on" class=" BMap_scaleCtrl BMap_noprint anchorBL"
                         style="bottom: 18px; right: auto; top: auto; left: 81px; width: 88px; position: absolute; z-index: 10; -moz-user-select: none;">
                        <div unselectable="on" class="BMap_scaleTxt"
                             style="background-color: transparent; color: black;">500&nbsp;米
                        </div>
                        <div class="BMap_scaleBar BMap_scaleHBar" style="background-color: black;"><img
                                src="style/images/mapctrls.png" style="border:none"></div>
                        <div class="BMap_scaleBar BMap_scaleLBar" style="background-color: black;"><img
                                src="style/images/mapctrls.png" style="border:none"></div>
                        <div class="BMap_scaleBar BMap_scaleRBar" style="background-color: black;"><img
                                src="style/images/mapctrls.png" style="border:none"></div>
                    </div>
                    <div unselectable="on" class=" BMap_omCtrl BMap_ieundefined BMap_noprint anchorBR quad4"
                         style="width: 13px; height: 13px; bottom: 0px; right: 0px; top: auto; left: auto; position: absolute; z-index: 10; -moz-user-select: none;">
                        <div class="BMap_omOutFrame" style="width: 149px; height: 149px;">
                            <div class="BMap_omInnFrame"
                                 style="bottom: auto; right: auto; top: 5px; left: 5px; width: 142px; height: 142px;">
                                <div class="BMap_omMapContainer"></div>
                                <div class="BMap_omViewMv" style="cursor: grab;">
                                    <div class="BMap_omViewInnFrame">
                                        <div></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="BMap_omBtn BMap_omBtnClosed"
                             style="bottom: 0px; right: 0px; top: auto; left: auto;"></div>
                    </div>
                    <div unselectable="on" class=" BMap_cpyCtrl BMap_noprint anchorBL"
                         style="cursor: default; white-space: nowrap; -moz-user-select: none; color: black; background: none repeat scroll 0% 0% transparent; font: 11px/15px arial,simsun,sans-serif; bottom: 2px; right: auto; top: auto; left: 4px; position: absolute; z-index: 10;">
                        <span _cid="1" style="display: inline;"><span style="font-size:11px">&copy; 2019 Baidu&nbsp;- Data &copy; <a
                                style="display:inline;" href="http://www.navinfo.com/" target="_blank">NavInfo</a> &amp; <a
                                style="display:inline;" href="http://www.cennavi.com.cn/" target="_blank">CenNavi</a> &amp; <a
                                style="display:inline;" href="http://www.365ditu.com/"
                                target="_blank">道道通</a></span></span></div>
                </div>
            </div><!--/#baiduMap-->
        </div>
        <!------------------------------------- end ----------------------------------------->

        <script src="style/js/jquery.tinymce.js" type="text/javascript"></script>
        <script src="style/js/jobs.min.js" type="text/javascript" charset="UTF-8"></script>
        <script src="http://api.map.baidu.com/api?v=2.0&amp;ak=A2c1a1ff1fe0750e3290660295aac602"
                type="text/javascript"></script>
        <script src="http://api.map.baidu.com/getscript?v=2.0&amp;ak=A2c1a1ff1fe0750e3290660295aac602&amp;services=&amp;t=20140617153133"
                type="text/javascript"></script>
        <script type="text/javascript">
            //百度地图API功能
            var map = new BMap.Map("allmap");
            //控件添加
            map.addControl(new BMap.NavigationControl());
            map.addControl(new BMap.MapTypeControl());
            map.addControl(new BMap.ScaleControl());
            map.addControl(new BMap.OverviewMapControl());

            var point = new BMap.Point(116.331398, 39.897445);//初始化坐标点
            map.centerAndZoom(point, 15);
            /* map.centerAndZoom(, 15); */
            map.enableScrollWheelZoom(true);//允许缩放
            var gc = new BMap.Geocoder();//地址定位
            var local = new BMap.LocalSearch(map, {
                renderOptions: {map: map}
            });

            function showInfo(e) {
                map.clearOverlays();//清除所有覆盖物
                //map.centerAndZoom(new BMap.Point(olng, olat), 11);//重定义中心点
                //alert(e.point.lng + ", " + e.point.lat);
                var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));  // 创建标注
                marker.addEventListener("mouseup", function (em) {//覆盖物监听事件--释放鼠标时定位覆盖物位置
                    var pt = em.point;//移动后重新定位
                    gc.getLocation(pt, function (rs) {
                        var addComp = rs.addressComponents;
                        var label = new BMap.Label("我的坐标：" + em.point.lng + ", " + em.point.lat + "  我的地址：" + addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber, {offset: new BMap.Size(20, -10)});
                        // marker.setLabel(label);//新坐标-新地址
                        if (rs) {
                            var sContent = rs.address;
                            var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
                            //图片加载完毕重绘infowindow
                            marker.openInfoWindow(infoWindow);
                        }

                        $('#lat').val(em.point.lat);
                        $('#lng').val(em.point.lng);
                    });
                });
                marker.enableDragging();    //可拖拽
                map.addOverlay(marker);     // 将标注添加到地图中

                /////////////////////地址定位
                var pt = e.point;
                gc.getLocation(pt, function (rs) {
                    var addComp = rs.addressComponents;
                    var label = new BMap.Label("我的坐标：" + e.point.lng + ", " + e.point.lat + "  我的地址：" + addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber, {offset: new BMap.Size(20, -10)});
                    //marker.setLabel(label);
                    if (rs) {
                        var sContent = rs.address;
                        var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
                        //图片加载完毕重绘infowindow
                        marker.openInfoWindow(infoWindow);
                    }

                    $('#lat').val(e.point.lat);
                    $('#lng').val(e.point.lng);
                });

                //////////////////////重置中心点
                olng = e.point.lng;
                olat = e.point.lat;
            }

            map.addEventListener("click", showInfo);//地图点击事件

            $(function () {
                $('#mapPreview').bind('click', function () {
                    $.colorbox({inline: true, href: "#baiduMap", title: "公司地址"});
                    var address = $('#positionAddress').val();
                    var city = $('#workAddress').val();
                    map.setCurrentCity(city);
                    map.setZoom(15);
                    gc.getPoint(address, function (point) {
                        if (point) {
                            map.centerAndZoom(point, 15);
                            map.setZoom(15);
                            map.setCenter(point);
                            local.search(address);
                        }
                    }, city);
                    /* map.addEventListener("tilesloaded",function(){
	    	map.setZoom(15);
	    }); */
                });
            });
        </script>

        <div class="clear"></div>
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
    </div><!-- end #container -->
</div><!-- end #body -->
<div id="footer">
    <div class="wrapper">
        <a rel="nofollow" target="_blank" href="about.html">联系我们</a>
        <a target="_blank" href="http://www.lagou.com/af/zhaopin.html">互联网公司导航</a>
    </div>
</div>

<script src="style/js/core.min.js" type="text/javascript"></script>
<script src="style/js/popup.min.js" type="text/javascript"></script>

<script>
    /**
     * 功能：post方式提交
     * 参数列表：url：提交的地址；params：参数列表
     */
    function post(url, params) {
        var temp = document.createElement("form"); //创建form表单
        temp.action = url;
        temp.method = "post";
        temp.style.display = "none";//表单样式为隐藏
        for (var item in params) {//初始化表单内部的控件
            //根据实际情况创建不同的标签元素
            var opt =document.createElement("input");  //添加input标签
            opt.type="text";   //类型为text
            opt.id = item;      //设置id属性
            opt.name = item;    //设置name属性
            opt.value = params[item];   //设置value属性
            temp.appendChild(opt);
        }

        document.body.appendChild(temp);
        temp.submit();
        return temp;
    }
</script>

</body>
</html>