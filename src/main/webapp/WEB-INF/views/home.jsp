<%--
  Created by IntelliJ IDEA.
  User: 19653
  Date: 2019/2/9
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
    <link rel="alternate" media="handheld"/>
    <title>校园招-专注大学生实习招聘</title>

    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link rel="stylesheet" type="text/css" href="style/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/external.min.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/popup.css"/>
    <script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
    <script src="style/js/ajaxfileupload.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/additional-methods.js"></script>
</head>
<body>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a href="home" class="logo">
                <img src="style/images/logo.png" width="229" height="43" alt="校园招-专注大学生实习招聘"/>
            </a>
            <ul class="reset" id="navheader">
                <li class="current"><a href="home">首页</a></li>
                <li><a href="companylist">公司</a></li>
                <li><a href="yanzhi" target="_blank">言职</a></li>
                <c:if test="${sessionScope.emp != null}">
                    <li><a href="jianli" rel="nofollow">我的简历</a></li>
                </c:if>
                <c:if test="${sessionScope.company != null}">
                    <li><a href="create" rel="nofollow">招聘管理</a></li>
                </c:if>
            </ul>
            <ul class="loginTop">
                <c:if test="${sessionScope.emp == null && sessionScope.company == null}">
                    <input type="hidden" value="无用户" id="isLogin">
                    <li><a href="login" rel="nofollow">登录</a></li>
                </c:if>
                <c:if test="${sessionScope.emp != null || sessionScope.company != null}">
                    <li><a href="quit" rel="nofollow">退出</a></li>
                </c:if>
                <li>|</li>
                <li><a href="register" rel="nofollow">注册</a></li>
            </ul>
        </div>
    </div><!-- end #header -->
    <div id="container">

        <div id="sidebar">
            <div class="mainNavs">
                <c:forEach items="${sessionScope.bigJob}" var="big">
                    <div class="menu_box">
                        <div class="menu_main">
                            <h2>${big.bigName}<span></span></h2>
                            <c:forEach items="${sessionScope.midJob}" var="mid">
                                <c:if test="${mid.bigId == big.bigId}">
                                    <c:forEach items="${sessionScope.smallJob}" var="small">
                                        <c:if test="${small.midId == mid.midId && small.ishot == 1}">
                                            <a onclick="searchJob('${small.smallName}')">${small.smallName}</a>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="menu_sub dn">
                            <c:forEach items="${sessionScope.midJob}" var="mid">
                                <c:if test="${mid.bigId == big.bigId}">
                                    <dl class="reset">
                                        <dt>
                                            <a onclick="searchMid('${mid.midName}')">${mid.midName}</a>
                                        </dt>
                                        <dd>
                                            <c:forEach items="${sessionScope.smallJob}" var="small">
                                                <c:if test="${small.midId == mid.midId}">
                                                    <a onclick="searchJob('${small.smallName}')">${small.smallName}</a>
                                                </c:if>
                                            </c:forEach>
                                        </dd>
                                    </dl>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="content">
            <div id="search_box">
                <form id="searchForm" name="searchForm" method="post">
                    <ul id="searchType">
                        <li data-searchtype="1" class="type_selected">职位</li>
                        <li data-searchtype="4">公司</li>
                    </ul>
                    <div class="searchtype_arrow"></div>
                    <input style="width: 494px;height: 37px" type="text" id="search_input" name="kd" tabindex="1"
                           value="" placeholder="请输入职位名称，如：产品经理"/>
                    <input type="button" id="search_button" value="搜索"/>
                </form>
            </div>

            <script type="text/javascript" src="style/js/search.min.js" charset="UTF-8"></script>
            <dl class="hotSearch">
                <dt>热门搜索：</dt>
                <c:forEach items="${sessionScope.hotJob}" var="hot">
                    <dd><a onclick="searchJob('${hot.smallName}')">${hot.smallName}</a></dd>
                </c:forEach>
            </dl>
            <div id="home_banner">
                <ul class="banner_bg">
                    <li class="banner_bg_1 current">
                        <a href="javascript:"
                           target="_blank"><img src="style/images/d05a2cc6e6c94bdd80e074eb05e37ebd.jpg" width="612"
                                                height="160" alt="好买基金——来了就给100万"/></a>
                    </li>
                    <li class="banner_bg_2">
                        <a href="javascript:"
                           target="_blank"><img src="style/images/c9d8a0756d1442caa328adcf28a38857.jpg" width="612"
                                                height="160" alt="世界杯放假看球，老板我也要！"/></a>
                    </li>
                    <li class="banner_bg_3">
                        <a href="javascript:"
                           target="_blank"><img src="style/images/d03110162390422bb97cebc7fd2ab586.jpg" width="612"
                                                height="160" alt="出北京记——第一站厦门"/></a>
                    </li>
                </ul>
                <div class="banner_control">
                    <em></em>
                    <ul class="thumbs">
                        <li class="thumbs_1 current">
                            <i></i>
                            <img src="style/images/4469b1b83b1f46c7adec255c4b1e4802.jpg" width="113" height="42"/>
                        </li>
                        <li class="thumbs_2">
                            <i></i>
                            <img src="style/images/381b343557774270a508206b3a725f39.jpg" width="113" height="42"/>
                        </li>
                        <li class="thumbs_3">
                            <i></i>
                            <img src="style/images/354d445c5fd84f1990b91eb559677eb5.jpg" width="113" height="42"/>
                        </li>
                    </ul>
                </div>
            </div><!--/#main_banner-->

            <ul id="da-thumbs" class="da-thumbs">
                <c:forEach items="${sessionScope.ads}" var="ad" varStatus="s">
                    <c:if test="${s.last}">
                        <li class="last">
                            <a href="${ad.adSite}" target="_blank">
                                <img src="${ad.adImg}" width="113" height="113" alt="${ad.adName}"/>
                                <div class="hot_info">
                                    <h2 title="${ad.adName}">${ad.adName}</h2>
                                    <em></em>
                                    <p title="${ad.adDescribe}">${ad.adDescribe}</p>
                                </div>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!s.last}">
                        <li>
                            <a href="${ad.adSite}" target="_blank">
                                <img src="${ad.adImg}" width="113" height="113" alt="${ad.adName}"/>
                                <div class="hot_info">
                                    <h2 title="${ad.adName}">${ad.adName}</h2>
                                    <em></em>
                                    <p title="${ad.adDescribe}">${ad.adDescribe}</p>
                                </div>
                            </a>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>

            <ul class="reset hotabbing">
                <li class="current">全职</li>
                <li>实习</li>
            </ul>
            <div id="hotList">
                <ul class="hot_pos reset">
                    <c:forEach items="${sessionScope.full_time}" var="position">
                        <li class="clearfix">
                            <div class="hot_pos_l">
                                <div class="mb10">
                                    <a href="javascript:post('jobdetail',{positionId:${position.positionId}})"
                                       target="_blank">${position.positionName}</a>
                                    &nbsp;
                                    <span class="c9">[${position.jobCity}]</span>
                                </div>
                                <span><em class="c7">月薪： </em>${position.minSalary}k-${position.maxSalary}k</span>
                                <span><em class="c7">经验：</em> ${position.jobExperience}</span>
                                <span><em class="c7">最低学历： </em>${position.degree}</span>
                                <br/>
                                <span><em class="c7">职位诱惑：</em>${position.positionTemptation}</span>
                                <br/>
                                <span><em class="c7">发布时间：</em>${position.releaseTime}</span>
                            </div>
                            <div class="hot_pos_r">
                                <div class="mb10 recompany"><a
                                        href="companyhome?companyId=${position.company.companyId}"
                                        target="_blank">${position.company.companyName}</a></div>
                                <span><em class="c7">领域：</em> ${position.company.field}</span>
                                <br/>
                                <span><em class="c7">阶段：</em> ${position.company.stage}</span>
                                <span><em class="c7">规模：</em>${position.company.scale}</span>
                                <ul class="companyTags reset">
                                    <c:set value="${fn:split(position.company.tag, '-')}" var="tags"/>
                                    <c:forEach var="tag" items="${tags}">
                                        <li>${tag}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </li>
                    </c:forEach>

                    <a href="list" class="btn fr" target="_blank">查看更多</a>
                </ul>
                <ul class="hot_pos hot_posHotPosition reset" style="display:none;">
                    <c:forEach items="${sessionScope.part_time}" var="position">
                        <li class="clearfix">
                            <div class="hot_pos_l">
                                <div class="mb10">
                                    <a href="javascript:post('jobdetail',{positionId:${position.positionId}})"
                                       target="_blank">${position.positionName}</a>
                                    &nbsp;
                                    <span class="c9">[${position.jobCity}]</span>
                                </div>
                                <span><em class="c7">月薪： </em>${position.minSalary}k-${position.maxSalary}k</span>
                                <span><em class="c7">经验：</em> ${position.jobExperience}</span>
                                <span><em class="c7">最低学历： </em>${position.degree}</span>
                                <br/>
                                <span><em class="c7">职位诱惑：</em>${position.positionTemptation}</span>
                                <br/>
                                <span><em class="c7">发布时间：</em>${position.releaseTime}</span>
                            </div>
                            <div class="hot_pos_r">
                                <div class="mb10 recompany"><a
                                        href="javascript:post('companyhome',{companyId:${position.company.companyId}})">${position.company.companyName}</a>
                                </div>
                                <span><em class="c7">领域：</em> ${position.company.field}</span>
                                <br/>
                                <span><em class="c7">阶段：</em> ${position.company.stage}</span>
                                <span><em class="c7">规模：</em>${position.company.scale}</span>
                                <ul class="companyTags reset">
                                    <c:set value="${fn:split(position.company.tag, '-')}" var="tags"/>
                                    <c:forEach var="tag" items="${tags}">
                                        <li>${tag}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </li>
                    </c:forEach>
                    <a href="list" class="btn fr" target="_blank">查看更多</a>
                </ul>
            </div>

            <div class="clear"></div>
        </div>
        <input type="hidden" value="" name="userid" id="userid"/>

        <!------------------------------------- end ----------------------------------------->
        <script type="text/javascript" src="style/js/home.min.js"></script>
        <div class="clear"></div>
        <input type="hidden" id="resubmitToken" value=""/>
        <a id="backtop" title="回到顶部" rel="nofollow"></a>
    </div><!-- end #container -->
</div><!-- end #body -->
<div id="footer">
    <div class="wrapper">
        <a>联系我们</a>
        <a>互联网公司导航</a>
        <a>加入我们</a>
        <a>软工1503·樊振宇</a>
    </div>
</div>

<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript" src="style/js/popup.min.js"></script>

<script>
    $(function () {
        if ($("#isLogin").val() == "无用户") {
            if (window.history && window.history.pushState) {
                $(window).on('popstate', function () {
                    window.history.pushState('forward', null, '#');
                    window.history.forward(1);
                });
            }
            window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
            window.history.forward(1);
        }
    })


    //搜索的ajax请求
    $("#search_button").click(function () {
        window.open("list", "_blank");
        jQuery.ajax({
            url: "${APP_PATH}/search",
            data: "type=" + $(".type_selected").text() + "&value=" + $("#search_input").val(),
            type: "POST",
        })
    })

    function searchJob(jobName) {
        window.open("list", "_blank");
        $.ajax({
            url: "${APP_PATH}/search",
            data: {"type": "职位", "value": jobName},
            type: "POST",
        })
    }

    function searchMid(midName) {
        window.open("list", "_blank");
        $.ajax({
            url: "${APP_PATH}/search",
            data: {"type": "二级职位", "value": midName},
            type: "POST"
        })
    }

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
            var opt = document.createElement("input");  //添加input标签
            opt.type = "text";   //类型为text
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
