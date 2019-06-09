<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>

    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>公司列表-校园招-最专业的大学生实习招聘平台</title>
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
                <img src="style/images/logo.png" width="229" height="43" alt="校园招-专注大学生招聘"/>
            </a>
            <ul class="reset" id="navheader">
                <li><a href="home">首页</a></li>
                <li class="current"><a href="companylist">公司</a></li>
                <li><a href="yanzhi" target="_blank">言职</a></li>
                <c:if test="${sessionScope.emp != null}">
                    <li><a href="jianli" rel="nofollow">我的简历</a></li>
                </c:if>
                <c:if test="${sessionScope.company != null}">
                    <li><a href="create" rel="nofollow">发布职位</a></li>
                </c:if>
            </ul>
            <ul class="loginTop">
                <c:if test="${sessionScope.emp == null && sessionScope.company == null}">
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

        <div class="clearfix">
            <div class="content_l">
                <form id="" name="companyListForm">
                    <dl class="hc_tag">
                        <dt>
                            <ul class="workplace reset fr" id="workplaceSelect">
                                <li>
                                    <a class="city">全国</a>
                                    |
                                </li>
                                <li>
                                    <a class="city">北京</a>
                                    |
                                </li>
                                <li>
                                    <a class="city">上海</a>
                                    |
                                </li>
                                <li>
                                    <a class="city">广州</a>
                                    |
                                </li>
                                <li>
                                    <a class="city">深圳</a>
                                    |
                                </li>
                                <li>
                                    <a class="city">成都</a>
                                    |
                                </li>
                                <li>
                                    <a class="city">杭州</a>
                                    |
                                </li>
                                <li>
                                    <a class="city">武汉</a>
                                    |
                                </li>
                                <li>
                                    <a class="city">南京</a>
                                    |
                                </li>
                                <li class="more">
                                    <a>其他</a>
                                    <div class="triangle citymore_arrow"></div>
                                </li>
                                <li id="box_expectCity" class="searchlist_expectCity dn">
                                    <span class="bot"></span>
                                    <span class="top"></span>
                                    <dl>
                                        <dt>ABCDEF</dt>
                                        <dd>
                                            <span class="city">北京</span>
                                            <span class="city">长春</span>
                                            <span class="city">成都</span>
                                            <span class="city">重庆</span>
                                            <span class="city">长沙</span>
                                            <span class="city">常州</span>
                                            <span class="city">东莞</span>
                                            <span class="city">大连</span>
                                            <span class="city">佛山</span>
                                            <span class="city">福州</span>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>GHIJ</dt>
                                        <dd>
                                            <span class="city">贵阳</span>
                                            <span class="city">广州</span>
                                            <span class="city">哈尔滨</span>
                                            <span class="city">合肥</span>
                                            <span class="city">海口</span>
                                            <span class="city">杭州</span>
                                            <span class="city">惠州</span>
                                            <span class="city">金华</span>
                                            <span class="city">济南</span>
                                            <span class="city">嘉兴</span>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>KLMN</dt>
                                        <dd>
                                            <span class="city">昆明</span>
                                            <span class="city">廊坊</span>
                                            <span class="city">宁波</span>
                                            <span class="city">南昌</span>
                                            <span class="city">南京</span>
                                            <span class="city">南宁</span>
                                            <span class="city">南通</span>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>OPQR</dt>
                                        <dd>
                                            <span class="city">青岛</span>
                                            <span class="city">泉州</span>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>STUV</dt>
                                        <dd>
                                            <span class="city">上海</span>
                                            <span class="city">石家庄</span>
                                            <span class="city">绍兴</span>
                                            <span class="city">沈阳</span>
                                            <span class="city">深圳</span>
                                            <span class="city">苏州</span>
                                            <span class="city">天津</span>
                                            <span class="city">太原</span>
                                            <span class="city">台州</span>
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>WXYZ</dt>
                                        <dd>
                                            <span class="city">武汉</span>
                                            <span class="city">无锡</span>
                                            <span class="city">温州</span>
                                            <span class="city">西安</span>
                                            <span class="city">厦门</span>
                                            <span class="city">烟台</span>
                                            <span class="city">珠海</span>
                                            <span class="city">中山</span>
                                            <span class="city">郑州</span>
                                        </dd>
                                    </dl>
                                </li>
                            </ul>
                        </dt>
                        <dd>
                            <dl>
                                <dt>发展阶段：</dt>
                                <dd class="stage">
                                    <a>初创型</a>
                                    <a>成长型</a>
                                    <a>成熟型</a>
                                    <a>已上市</a>
                                </dd>
                            </dl>
                            <dl>
                                <dt>行业领域：</dt>
                                <dd class="field">
                                    <a>移动互联网</a>
                                    <a>电子商务</a>
                                    <a>社交</a>
                                    <a>企业服务</a>
                                    <a>O2O</a>
                                    <a>教育</a>
                                    <a>文化艺术</a>
                                    <a>游戏</a>
                                    <a>在线旅游</a>
                                    <a>金融互联网</a>
                                    <a>健康医疗</a>
                                    <a>生活服务</a>
                                    <a>硬件</a>
                                    <a>搜索</a>
                                    <a>安全</a>
                                    <a>运动体育</a>
                                    <a>云计算\大数据</a>
                                    <a>移动广告</a>
                                    <a>社会化营销</a>
                                    <a>视频多媒体</a>
                                    <a>媒体</a>
                                    <a>智能家居</a>
                                    <a>智能电视</a>
                                    <a>分类信息</a>
                                    <a>招聘</a>
                                </dd>
                            </dl>
                        </dd>
                    </dl>
                    <ul class="hc_list reset">
                        <c:forEach items="${companies.list}" var="company">
                            <li>
                                <a href="companyhome?companyId=${company.companyId}" target="_blank">
                                    <h3>${company.companyName}</h3>
                                    <div class="comLogo">
                                        <c:if test="${company.companyLogo == ''}">
                                            <img src="style/images/logo_default.png" width="190" height="190" alt=${company.companyName}/>
                                        </c:if>
                                        <c:if test="${company.companyLogo != ''}">
                                            <img src="${company.companyLogo}" width="190" height="190" alt=${company.companyName}/>
                                        </c:if>
                                        <ul>
                                            <li>${company.companyCity}，${company.stage}</li>
                                        </ul>
                                    </div>
                                </a>

                                <ul class="reset ctags">
                                    <c:set value="${fn:split(company.tag, '-')}" var="tags"/>
                                    <c:forEach var="tag" items="${tags}">
                                        <li>${tag}</li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:forEach>
                    </ul>

                    <div class="Pagination myself">
                        <a href="companylist?pn=1" title="1">首页</a>
                        <c:if test="${companies.hasPreviousPage}">
                            <a href="companylist?pn=${companies.pageNum-1}">上一页</a>
                        </c:if>
                        <c:forEach items="${companies.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num == companies.pageNum}">
                                <a class="current" href="#" title="${page_Num}">${page_Num}</a>
                            </c:if>
                            <c:if test="${page_Num != companies.pageNum}">
                                <a href="companylist?pn=${page_Num}" title="${page_Num}">${page_Num}</a>
                            </c:if>
                        </c:forEach>
                        <c:if test="${companies.hasNextPage}">
                            <a href="companylist?pn=${companies.pageNum+1}" title="${companies.pageNum+1}">下一页 </a>
                        </c:if>
                        <a href="companylist?pn=${companies.pages}" title="${companies.pages}">尾页</a>
                    </div>
                </form>
            </div>
            <div class="content_r">
                <div class="subscribe_side">
                    <c:if test="${sessionScope.emp != null}">
                        <a href="list" target="_blank">
                            <div class="subpos"><span>收藏</span> 职位</div>
                            <div class="c7">若不想立即投递简历，你可以对有意向的职位进行收藏
                            </div>
                            <i>我要收藏职位</i>
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.company != null}">
                        <a href="create" target="_blank">
                            <div class="subpos"><span>发布</span> 职位</div>
                            <div class="c7">快来发布职位，为你的公司招贤纳士吧
                            </div>
                            <i>我要发布职位</i>
                        </a>
                    </c:if>
                </div>

                <a href="javascript:void(0)" target="_blank" class="eventAd">
                    <img src="style/images/subject280.jpg" width="280" height="135"/>
                </a>
                <a href="javascript:void(0)" target="_blank" class="eventAd">
                    <img src="style/images/rising280.png" width="280" height="135"/>
                </a>
            </div>
        </div>

        <input type="hidden" value="" name="userid" id="userid"/>

        <script type="text/javascript" src="style/js/company_list.min.js"></script>

        <div class="clear"></div>
        <input type="hidden" id="resubmitToken" value=""/>
        <a id="backtop" title="回到顶部" rel="nofollow"></a>
    </div><!-- end #container -->
</div><!-- end #body -->
<div id="footer">
    <div class="wrapper">
        <a href="h/about.html" target="_blank" rel="nofollow">联系我们</a>
        <a href="h/af/zhaopin.html" target="_blank">互联网公司导航</a>
    </div>
</div>

<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript" src="style/js/popup.min.js"></script>

<!--  -->
<script>
    function show_company(companys){
        if (companys.length == 0){
            $(".hc_list").empty();
            $(".Pagination").empty()
            $(".hc_list").append("<h2 align='center'>无符合条件的公司</h2>")
        }else{
            $(".hc_list").empty();
            var li = "";
            $.each(companys,function (i,item) {
                var tag = item.tag.split("-");
                var tag_li = "";
                $.each(tag,function (i,item) {
                    tag_li +="<li>"+ item +"</li>"
                })
                li += "<li><a href='companyhome?companyId="+ item.companyId +"' target='_blank'>" +
                    "<h3>"+ item.companyName +"</h3>" +
                    "<div class='comLogo'>" +
                    "<img src='"+ item.companyLogo +"' width='190' height='190' alt='"+ item.companyName +"'/>" +
                    "<ul><li>"+ item.companyCity + "，" + item.stage +"" +
                    "</li></ul> </div>  </a>" +
                    "<ul class='reset ctags'>" + tag_li +
                    "</ul></li>"
            })
            $(".hc_list").append(li);
        }
    }

    function find_field(){
        var field = "";
        $(".field a").each(function () {
            if ($(this).hasClass("current")){
                field = $(this).text();
            }
        })
        return field;
    }

    function find_stage(){
        var stage = "";
        $(".stage a").each(function () {
            if ($(this).hasClass("current")){
                stage = $(this).text();
            }
        })
        return stage;
    }

    function find_city(){
        var city = "全国";
        $(".city").each(function () {
            if ($(this).hasClass("current")){
                city = $(this).text();
            }
        })
        return city;
    }


    $(".city").click(function () {
        var cityName = $(this).text();
        var stage = find_stage();
        var field = find_field();
        if ($(this).hasClass("current")) {
            $(this).removeClass("current");
            cityName = "全国";
        }else {
            $(".current").removeClass("current");
            $(this).addClass("current");
        }
        $.ajax({
            url:"${APP_PATH}/companylist_select",
            type:"POST",
            data:{  city:cityName,
                    stage:stage,
                    field:field},
            success:function (result) {
                show_company(result.extend.company)
            }
        })
    })
    
    $(".stage a").click(function () {
        var cityName = find_city();
        var field = find_field();
        var stage = $(this).text();
        if($(this).hasClass("current")){
            stage = "";
        }
        $.ajax({
            url:"companylist_select",
            data:{  city:cityName,
                    stage:stage,
                    field:field},
            type:"POST",
            success:function (result) {
                show_company(result.extend.company)
            }
        })
    })

    $(".field a").click(function () {
        var cityName = find_city();
        var field = $(this).text();
        var stage = find_stage();
        if($(this).hasClass("current")){
            field = "";
        }
        $.ajax({
            url:"companylist_select",
            data:{  city:cityName,
                stage:stage,
                field:field},
            type:"POST",
            success:function (result) {
                show_company(result.extend.company)
            }
        })
    })
</script>

</body>
</html>