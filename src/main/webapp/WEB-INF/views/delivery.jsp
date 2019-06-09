<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>我的投递记录-招聘服务</title>
    <link href="style/css/style.css" type="text/css" rel="stylesheet">
    <link href="style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="style/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
    <script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
</head>
<body>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a class="logo" href=home">
                <img width="229" height="43" alt="校园招-专注大学生实习招聘" src="style/images/logo.png">
            </a>
            <ul id="navheader" class="reset">
                <li><a href="home">首页</a></li>
                <li><a href="companylist">公司</a></li>
                <li><a href="yanzhi">言职</a></li>
                <li><a rel="nofollow" href="jianli">我的简历</a></li>
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
                <dl class="c_delivery">
                    <dt>
                        <h1><em></em>已投递简历状态</h1>
                        <a class="d_refresh" >刷新</a>
                    </dt>
                    <dd>
                        <div class="delivery_tabs">
                            <ul class="reset" id="type" type="${type}">
                                <li id="-1">
                                    <a href="javascript:post('delivery',{type:-1})">全部</a>
                                </li>
                                <li id="0">
                                    <a href="javascript:post('delivery',{type:0})">未被处理</a>
                                </li>
                                <li id="3">
                                    <a href="javascript:post('delivery',{type:3})">待定</a>
                                </li>
                                <li id="1">
                                    <a href="javascript:post('delivery',{type:1})">通知面试</a>
                                </li>
                                <li class="last" id="2">
                                    <a href="javascript:post('delivery',{type:2})">不合适</a>
                                </li>
                            </ul>
                        </div>
                        <form id="deliveryForm">
                            <ul class="reset my_delivery">
                                <c:if test="${toudis.size() == 0}">
                                    <h2 align="center">无投递的简历</h2>
                                </c:if>
                                <c:if test="${toudis.size() !=0}">
                                    <c:forEach items="${toudis}" var="toudi">
                                        <li>
                                            <div class="d_item">
                                                <h2 title="${toudi.position.positionName}">
                                                    <a target="_blank" href="http://www.lagou.com/jobs/149594.html">
                                                        <em>${toudi.position.positionName}</em>
                                                        <span>（${toudi.position.minSalary}k-${toudi.position.maxSalary}k）</span>
                                                    </a>
                                                </h2>
                                                <div class="clear"></div>
                                                <a title="${toudi.position.company.companyName}" class="d_jobname" target="_blank"
                                                   href="http://www.lagou.com/c/25927.html">
                                                        ${toudi.position.company.companyName} <span>[${toudi.position.jobCity}]</span>
                                                </a>
                                                <span class="d_time">${toudi.toudiDate}</span>
                                                <div class="clear"></div>
                                                <div class="d_resume">
                                                    使用简历：
                                                    <span>在线简历</span>
                                                </div>
                                                <a class="btn_showprogress">
                                                    ${toudi.type}
                                                    <i></i></a>
                                            </div>
                                            <div class="progress_status	dn">
                                                <c:if test="${toudi.toudiType == 0}">
                                                    <ul class="status_steps">
                                                        <li class="status_done status_1">1</li>
                                                        <li class="status_line status_line_grey"><span></span></li>
                                                        <li class="status_grey"><span>2</span></li>
                                                        <li class="status_line status_line_grey"><span></span></li>
                                                        <li class="status_grey"><span>3</span></li>
                                                        <li class="status_line status_line_grey"><span></span></li>
                                                        <li class="status_grey"><span>4</span></li>
                                                    </ul>
                                                    <ul class="status_text">
                                                        <li>投递成功</li>
                                                        <li class="status_text_2">简历被查看</li>
                                                        <li class="status_text_3">通过初步筛选</li>
                                                        <li style="margin-left: 65px;" class="status_text_4">通知面试</li>
                                                    </ul>
                                                </c:if>
                                                <c:if test="${toudi.toudiType == 1}">
                                                    <ul class="status_steps">
                                                        <li class="status_done status_1">1</li>
                                                        <li class="status_line status_line_done"><span></span></li>
                                                        <li class="status_done"><span>2</span></li>
                                                        <li class="status_line status_line_done"><span></span></li>
                                                        <li class="status_done"><span>3</span></li>
                                                        <li class="status_line status_line_done"><span></span></li>
                                                        <li class="status_done"><span>4</span></li>
                                                    </ul>
                                                    <ul class="status_text">
                                                        <li>投递成功</li>
                                                        <li class="status_text_2">简历被查看</li>
                                                        <li class="status_text_3">通过初步筛选</li>
                                                        <li style="margin-left: 65px;" class="status_text_4">通知面试</li>
                                                    </ul>
                                                </c:if>
                                                <c:if test="${toudi.toudiType == 2}">
                                                    <ul class="status_steps">
                                                        <li class="status_done status_1">1</li>
                                                        <li class="status_line status_line_done"><span></span></li>
                                                        <li class="status_done"><span>2</span></li>
                                                        <li class="status_line status_line_done"><span></span></li>
                                                        <li class="status_done"><span>3</span></li>
                                                        <li class="status_line status_line_done"><span></span></li>
                                                        <li class="status_done"><span>4</span></li>
                                                    </ul>
                                                    <ul class="status_text">
                                                        <li>投递成功</li>
                                                        <li class="status_text_2">简历被查看</li>
                                                        <li class="status_text_3">通过初步筛选</li>
                                                        <li style="margin-left: 75px;*margin-left: 60px;" class="status_text_4">不合适</li>
                                                    </ul>
                                                </c:if>
                                                <c:if test="${toudi.toudiType == 3}">
                                                    <ul class="status_steps">
                                                        <li class="status_done status_1">1</li>
                                                        <li class="status_line status_line_done"><span></span></li>
                                                        <li class="status_done"><span>2</span></li>
                                                        <li class="status_line status_line_done"><span></span></li>
                                                        <li class="status_done"><span>3</span></li>
                                                        <li class="status_line status_line_grey"><span></span></li>
                                                        <li class="status_grey"><span>4</span></li>
                                                    </ul>
                                                    <ul class="status_text">
                                                        <li>投递成功</li>
                                                        <li class="status_text_2">简历被查看</li>
                                                        <li class="status_text_3" style="margin-left: 90px">待定</li>
                                                        <li style="margin-left: 100px;" class="status_text_4">面试通知</li>
                                                    </ul>
                                                </c:if>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                            <input type="hidden" value="-1" name="tag">
                            <input type="hidden" value="" name="r">
                        </form>
                    </dd>
                </dl>
            </div>
            <div class="content_r">
                <div class="mycenterR" id="myInfo">
                    <h2>我的信息</h2>
                    <a href="collections">我收藏的职位</a>
                    <br>
                    <a href="javascript:post('delivery',{type:-1})">已投递简历状态</a>
                </div><!--end #myInfo-->
                <div class="greybg qrcode mt20">
                    <img width="242" height="242" alt="拉勾微信公众号二维码" src="style/images/qr_delivery.png">
                    <span class="c7">扫描拉勾二维码，微信轻松搜工作</span>
                </div>
            </div>
        </div>
        <script src="style/js/delivery.js"></script>
        <div class="clear"></div>
        <input type="hidden" value="" id="resubmitToken">
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
</body>

<script>
    $(function () {
        if ($("#type").attr("type") == -1){
            $("#-1").addClass("current")
        }else if ($("#type").attr("type") == 0){
            $("#0").addClass("current")
        } else if ($("#type").attr("type") == 1){
            $("#1").addClass("current")
        } else if ($("#type").attr("type") == 2){
            $("#2").addClass("current")
        } else if ($("#type").attr("type") == 3) {
            $("#3").addClass("current")
        }
    })

    $(".d_refresh").click(function () {
        location.reload()
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
</html>