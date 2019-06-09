<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>

    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>职位搜索-校园招-最专业的大学生实习招聘平台</title>
    <link rel="stylesheet" type="text/css" href="style/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/external.min.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/popup.css"/>
    <script src="style/js/jquery.1.10.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="style/js/jquery.lib.min.js" charset="utf-8"></script>
    <script src="style/js/ajaxfileupload.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="style/js/additional-methods.js" charset="utf-8"></script>
</head>
<body onkeydown="search()" >
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a href="home" class="logo">
                <img src="style/images/logo.png" width="229" height="43" alt="校园招-专注大学生实习招聘"/>
            </a>
            <ul class="reset" id="navheader">
                <li><a href="home">首页</a></li>
                <li><a href="companylist">公司</a></li>
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

    <style>
        #options .current {
            color: #fff;
            background: #91cebe;
        }
    </style>

    <div id="container">
        <div class="sidebar">
            <div id="options" class="greybg">
                <dl>
                    <dt>月薪范围 <em></em></dt>
                    <dd class="salary">
                        <div num="0-2">2k以下</div>
                        <div num="2-5">2k-5k</div>
                        <div num="5-10">5k-10k</div>
                        <div num="10-15">10k-15k</div>
                        <div num="15-25">15k-25k</div>
                        <div num="25-99999">25k以上</div>
                    </dd>
                </dl>
                <dl>
                    <dt>工作经验 <em></em></dt>
                    <dd class="job_experience">
                        <div>不限</div>
                        <div>应届毕业生</div>
                        <div>1年以下</div>
                        <div>1-3年</div>
                        <div>3-5年</div>
                        <div>5年以上</div>
                    </dd>
                </dl>
                <dl>
                    <dt>最低学历 <em></em></dt>
                    <dd class="degree">
                        <div>不限</div>
                        <div>大专</div>
                        <div>本科</div>
                        <div>硕士</div>
                        <div>博士</div>
                    </dd>
                </dl>
                <dl>
                    <dt>工作性质 <em></em></dt>
                    <dd class="job_type">
                        <div>全职</div>
                        <div>实习</div>
                    </dd>
                </dl>
            </div>

            <!-- QQ群 -->
            <div class="qq_group">
                加入<span>前端</span>QQ群
                <div class="f18">跟同行聊聊</div>
                <p>160541839</p>
            </div>

            <!-- 对外合作广告位  -->
            <a href="http://www.w3cplus.com/" target="_blank" class="partnersAd">
                <img src="style/images/w3cplus.png" width="230" height="80" alt="w3cplus"/>
            </a>
            <a href="" target="_blank" class="partnersAd">
                <img src="style/images/jquery_school.jpg" width="230" height="80" alt="JQ学校"/>
            </a>
            <a href="http://linux.cn/" target="_blank" class="partnersAd">
                <img src="style/images/linuxcn.png" width="230" height="80" alt="Linux中文社区"/>
            </a>
            <a href="http://www.imooc.com" target="_blank" class="partnersAd">
                <img src="style/images/muke.jpg" width="230" height="80" alt="幕课网"/>
            </a>
        </div>

        <div class="content">
            <div id="search_box">
                <ul id="searchType">
                    <li data-searchtype="1" class="type_selected">职位</li>
                    <li data-searchtype="4">公司</li>
                </ul>
                <div class="searchtype_arrow"></div>
                <input type="text" id="search_input" name="kd" tabindex="1" value=""
                       placeholder="请输入职位名称，如：产品经理"/>
                <input type="hidden" searchType="${searchType}" searchValue="${searchValue}" id="searchValue">
                <input type="button" id="search_button" value="搜索" onclick="searchPosition()"/>
            </div>
            <style>

                .ui-autocomplete {
                    width: 488px;
                    background: #fafafa !important;
                    position: relative;
                    z-index: 10;
                    border: 2px solid #91cebe;
                }

                .ui-autocomplete-category {
                    font-size: 16px;
                    color: #999;
                    width: 50px;
                    position: absolute;
                    z-index: 11;
                    right: 0px; /*top: 6px; */
                    text-align: center;
                    border-top: 1px dashed #e5e5e5;
                    padding: 5px 0;
                }

                .ui-menu-item {
                    *width: 439px;
                    vertical-align: middle;
                    position: relative;
                    margin: 0px;
                    margin-right: 50px !important;
                    background: #fff;
                    border-right: 1px dashed #ededed;
                }

                .ui-menu-item a {
                    display: block;
                    overflow: hidden;
                }
            </style>
            <script type="text/javascript" src="style/js/search.min.js" charset="utf-8"></script>
            <dl class="hotSearch">
                <dt>热门搜索：</dt>
                <c:forEach items="${sessionScope.hotJob}" var="hot">
                    <c:if test="${hot.ishot == 1}">
                        <dd><a class="searchName">${hot.smallName}</a></dd>
                    </c:if>
                </c:forEach>
            </dl>
            <div class="breakline"></div>
            <dl class="workplace" id="workplaceSelect">
                <dt class="fl">工作地点：</dt>
                <dd>
                    <a href="javascript:;" class="current city">全国</a>
                    |
                </dd>
                <dd>
                    <a href="javascript:;" class="city">北京</a>
                    |
                </dd>
                <dd>
                    <a href="javascript:;" class="city">上海</a>
                    |
                </dd>
                <dd>
                    <a href="javascript:;" class="city">广州</a>
                    |
                </dd>
                <dd>
                    <a href="javascript:;" class="city">深圳</a>
                    |
                </dd>
                <dd>
                    <a href="javascript:;" class="city">成都</a>
                    |
                </dd>
                <dd>
                    <a href="javascript:;" class="city">杭州</a>
                    |
                </dd>
                <dd>
                    <a href="javascript:;" class="city">武汉</a>
                    |
                </dd>
                <dd>
                    <a href="javascript:;" class="city">南京</a>
                    |
                </dd>
                <dd class="more">
                    <a href="javascript:;">其他</a>
                    <div class="triangle citymore_arrow"></div>
                </dd>
                <dd id="box_expectCity" class="searchlist_expectCity dn">
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
                </dd>
            </dl>

            <ul class="hot_pos reset">
                <c:forEach items="${sessionScope.positions.list}" var="position">
                    <li class="odd clearfix">
                        <div class="hot_pos_l">
                            <div class="mb10">
                                <a href="javascript:post('jobdetail',{positionId:${position.positionId}})"
                                   target="_blank">${position.positionName}</a>
                                &nbsp;
                                <span class="c9">[${position.jobCity}]</span>
                            </div>
                            <span><em class="c7">月薪：</em>${position.minSalary}k-${position.maxSalary}k</span>
                            <span><em class="c7">经验：</em> ${position.jobExperience}</span>
                            <span><em class="c7">最低学历： </em>${position.degree}</span>
                            <br/>
                            <span><em class="c7">职位诱惑：</em>${position.positionTemptation}</span>
                            <br/>
                            <span><em class="c7">发布时间：</em>${position.releaseTime}</span>
                        </div>
                        <div class="hot_pos_r">
                            <c:if test="${sessionScope.emp != null}">
                                <input type="hidden" value="${sessionScope.emp.empId}" id="toudi">
                                <div class="apply">
                                    <a href="javascript:post('jobdetail',{positionId:${position.positionId}})"
                                       target="_blank">投个简历</a>
                                </div>
                            </c:if>

                            <div class="mb10"><a href="companyhome?companyId=${position.company.companyId}"
                                                 target="_blank">${position.company.companyName}</a></div>
                            <span><em class="c7">领域： </em>${position.company.field}</span>
                            <br/>
                            <span><em class="c7">阶段： </em>${position.company.stage}</span>
                            <span><em class="c7">规模： </em>${position.company.scale}</span>
                            <ul class="companyTags reset">
                                <c:set value="${fn:split(position.company.tag, '-')}" var="tags"/>
                                <c:forEach var="tag" items="${tags}">
                                    <li>${tag}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <c:if test="${sessionScope.positions.list.size() == 0}">
                <div><h3 style='text-align:center;margin-top: 20%'>没有符合条件的职位</h3></div>
            </c:if>
            <c:if test="${sessionScope.positions.list.size() != 0}">
                <div class="Pagination myself">
                    <a href="positionlist?pn=1" title="1">首页</a>
                    <c:if test="${sessionScope.positions.hasPreviousPage}">
                        <a href="positionlist?pn=${sessionScope.positions.pageNum-1}">上一页</a>
                    </c:if>
                    <c:forEach items="${sessionScope.positions.navigatepageNums}" var="page_Num">
                        <c:if test="${page_Num == sessionScope.positions.pageNum}">
                            <a href="#" class="current" title="${page_Num}">${page_Num}</a>
                        </c:if>
                        <c:if test="${page_Num != sessionScope.positions.pageNum}">
                            <a href="positionlist?pn=${page_Num}" title="${page_Num}">${page_Num}</a>
                        </c:if>
                    </c:forEach>
                    <c:if test="${sessionScope.positions.hasNextPage}">
                        <a href="positionlist?pn=${sessionScope.positions.pageNum+1}" title="${sessionScope.positions.pageNum+1}">下一页 </a>
                    </c:if>
                    <a href="positionlist?pn=${sessionScope.positions.pages}" title="${sessionScope.positions.pages}">尾页</a>
                </div>
            </c:if>

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
</div>

<script type="text/javascript" src="style/js/core.min.js" charset="utf-8"></script>
<script type="text/javascript" src="style/js/popup.min.js" charset="utf-8"></script>

<!--  -->

<script>

    function search() {
        if (event.keyCode == 13) {
            searchPosition();
        }
    }

    function show_position(positions) {
        var list = "";
        if (positions.length == 0) {
            $(".hot_pos").html("<div><h3 style='text-align:center;margin-top: 20%'>没有符合条件的职位</h3></div>");
            $(".Pagination").html("");
        } else {
            $.each(positions, function () {
                var li;
                li = "<li class='odd clearfix'>" +
                    "<div class='hot_pos_l'>" +
                    "<div class='mb10'>" +
                    "<a href='jobdetail?positionId=" + this.positionId + "' target='_blank'>" + this.positionName + "</a>" +
                    "&nbsp;&nbsp;&nbsp;" +
                    "<span class='c9'>[" + this.jobCity + "]</span>" +
                    "</div>" +
                    "<span><em class='c7'>月薪：</em>" + this.minSalary + "k-" + this.maxSalary + "k</span>" + "&nbsp;" +
                    "<span><em class='c7'>经验： </em>" + this.jobExperience + "</span> " +
                    "<span><em class='c7'>最低学历： </em>" + this.degree + "</span>" + "<br>" +
                    "<span><em class='c7'>职位诱惑：</em>" + this.positionTemptation + "</span>" + "<br>" +
                    "<span><em class='c7'>发布时间：</em>" + this.releaseTime + "</span>" +
                    "</div>" +
                    "<div class='hot_pos_r'>";
                var toudi = "";
                if ($("#toudi").val() != null) {
                    toudi = "<div class='apply'>" +
                        "<a href='jobdetail?positionId=" + this.positionId + "' target='_blank'>投个简历</a>" +
                        "</div>";
                }

                li = li + toudi + "<div class='mb10'><a href='companyhome?companyId=" + this.companyId + "' target='_blank'>" + this.company.companyName + "</a></div>" +
                    "<span><em class='c7'>领域： </em>" + this.company.field + "</span>" +
                    "<br/>" +
                    "<span><em class='c7'>阶段： </em>" + this.company.stage + " </span>" +
                    "<span><em class='c7'>规模： </em>" + this.company.scale + "</span>" +
                    "<ul class='companyTags reset'>";
                var arr = this.company.tag.split("-");
                var tag_li = "";
                for (var i = 0; i < arr.length; i++) {
                    tag_li += "<li>" + arr[i] + "</li>";
                }
                li = li + tag_li + "</ul></div></li>";
                list += li;
            })
            $(".hot_pos").html(list);
        }
    }

    function find_salary() {
        var salary = "0-9999";
        $(".salary div").each(function () {
            if ($(this).hasClass("current")) {
                salary = $(this).attr("num");
            }
        })
        return salary;
    }

    function find_job_experience() {
        var job_experience = "";
        $(".job_experience div").each(function () {
            if ($(this).hasClass("current")) {
                job_experience = $(this).html();
            }
        })
        return job_experience;
    }

    function find_degree() {
        var degree = "";
        $(".degree div").each(function () {
            if ($(this).hasClass("current")) {
                degree = $(this).html();
            }
        })
        return degree;
    }

    function find_city() {
        var city = "全国";
        $(".city").each(function () {
            if ($(this).hasClass("current")) {
                city = $(this).text();
            }
        })
        return city;
    }

    function find_jobType() {
        var jobType = "";
        $(".job_type div").each(function () {
            if ($(this).hasClass("current")) {
                jobType = $(this).html();
            }
        })
        return jobType;
    }


    function select_position() {
        var city = find_city();
        var salary = find_salary();
        var job_experience = find_job_experience();
        var job_type = find_jobType();
        var degree = find_degree();

        $.ajax({
            url: "${APP_PATH}/positionlist_select",
            type: "POST",
            data: {
                city: city,
                salary: salary,
                job_experience: job_experience,
                job_type: job_type,
                degree: degree,
            },
            success: function (result) {
                show_position(result.extend.positions)
            }
        })
    }


    //工资
    $(".salary div").click(function () {
        if ($(this).hasClass("current")) {
            $(this).removeClass("current")
        } else {
            $(".salary div").removeClass("current");
            $(this).addClass("current");
        }
        select_position()
    })

    //工作经验
    $(".job_experience div").click(function () {
        if ($(this).hasClass("current")) {
            $(this).removeClass("current")
        } else {
            $(".job_experience div").removeClass("current");
            $(this).addClass("current");
        }
        select_position()
    })

    //最低学历
    $(".degree div").click(function () {
        if ($(this).hasClass("current")) {
            $(this).removeClass("current")
        } else {
            $(".degree div").removeClass("current");
            $(this).addClass("current");
        }
        select_position()
    })

    //工作性质
    $(".job_type div").click(function () {
        if ($(this).hasClass("current")) {
            $(this).removeClass("current")
        } else {
            $(".job_type div").removeClass("current");
            $(this).addClass("current");
        }
        select_position()
    })

    $(".city").on('click', function () {
        var city = "全国";
        var salary = find_salary();
        var job_experience = find_job_experience();
        var job_type = find_jobType();
        var degree = find_degree();
        if ($(this).hasClass("current")) {
            $(this).removeClass("current")
        } else {
            $(".city").removeClass("current");
            $(this).addClass("current");
            city = $(this).text();
        }
        $.ajax({
            url: "${APP_PATH}/positionlist_select",
            type: "POST",
            data: {
                city: city,
                salary: salary,
                job_experience: job_experience,
                job_type: job_type,
                degree: degree,
            },
            success: function (result) {
                show_position(result.extend.positions)
            }
        })
    })

    //搜索的ajax请求
    function searchPosition() {
        $("#searchValue").attr("searchType", $(".type_selected").text())
            .attr("searchValue", $("#search_input").val());
        $.ajax({
            url: "${APP_PATH}/search",
            data: "type=" + $(".type_selected").text() + "&value=" + $("#search_input").val(),
            type: "POST",
            success: function (result) {
                location.reload()
            }
        })
    }

    $(".searchName").click(function () {
        $.ajax({
            url: "${APP_PATH}/search",
            data: {"type": "职位", "value": this.text},
            type: "POST",
            success: function (result) {
                 location.reload()
            }
        })
    })


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