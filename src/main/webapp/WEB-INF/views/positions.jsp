<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
    <script async="" src="style/js/analytics.js"></script>
    <script type="text/javascript" async="" src="style/js/conversion.js"></script>
    <script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>

    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>我发布的职位-招聘服务-校园招-最专业的大学生实习招聘平台</title>

    <link href="style/css/style.css" type="text/css" rel="stylesheet">
    <link href="style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="style/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
    <script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
    <script src="style/js/additional-methods.js" type="text/javascript"></script>

    <script src="style/js/conv.js" type="text/javascript"></script>
    <script src="style/js/ajaxCross.json" charset="UTF-8"></script>
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
                <li><a rel="nofollow" href="create">招聘管理</a></li>
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
                <c:if test="${online == 1}">
                    <dd class="current">
                        <a href="javascript:post('positions',{isOnline:1})">有效职位</a>
                    </dd>
                    <dd>
                        <a href="javascript:post('positions',{isOnline:0})">已下线职位</a>
                    </dd>
                </c:if>
                <c:if test="${online == 0}">
                    <dd>
                        <a href="javascript:post('positions',{isOnline:1})">有效职位</a>
                    </dd>
                    <dd class="current">
                        <a href="javascript:post('positions',{isOnline:0})">已下线职位</a>
                    </dd>
                </c:if>
            </dl>
        </div><!-- end .sidebar -->
        <div class="content">
            <dl class="company_center_content">

                <dt>
                    <h1>
                        <em></em>
                        <c:if test="${online == 1}">有效职位 </c:if>
                        <c:if test="${online == 0}">下线职位 </c:if>
                        <span>（共<i style="color:#fff;font-style:normal" id="positionNumber">
                            ${sessionScope.positions.size()}</i>个）
                        </span>
                    </h1>

                </dt>

                <dd>
                    <form id="searchForm">
                        <input type="hidden" value="Publish" name="type">
                        <ul class="reset my_jobs">
                            <c:forEach items="${sessionScope.positions}" var="position">
                                <li data-id="149594">
                                    <h3>
                                        <a target="_blank" title="${position.positionName}"
                                           href="update?positionId=${position.positionId}">${position.positionName}</a>
                                        <span>[${position.jobCity}]</span>
                                    </h3>
                                    <div>${position.jobType} / ${position.minSalary}k-${position.maxSalary}k
                                        / ${position.jobExperience} / ${position.degree}</div>
                                    <div class="c9">发布时间： ${position.releaseTime}</div>
                                    <div class="links">
                                        <c:if test="${online == 1}">
                                            <a target="_blank" class="job_edit"
                                               href="update?positionId=${position.positionId}">编辑</a>
                                            <a class="job_offline" name="${position.positionId}">
                                                下线
                                            </a>
                                        </c:if>
                                        <c:if test="${online == 0}">
                                            <a class="job_online" name="${position.positionId}">
                                                上线
                                            </a>
                                        </c:if>
                                        <a class="job_del" name="${position.positionId}">
                                            删除
                                        </a>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </form>
                </dd>
            </dl>
        </div><!-- end .content -->
        <%--<script src="style/js/job_list.min.js" type="text/javascript" charset="UTF-8"></script>--%>
        <div class="clear"></div>
        <input type="hidden" value="74fb1ce14ebf4e2495270b0fbad64704" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop"></a>
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
<script src="style/js/tongji.js" type="text/javascript"></script>
<!--  -->
<script src="style/js/analytics01.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/h.js"></script>


<script>

    <%--职位下线--%>
    $(".job_offline").click(function () {
        var statu = confirm("确定要将该职位下线吗？下线后该职位将不再展现给用户");
        if (!statu) {
            return false;
        } else {
            $.ajax({
                url: "${APP_PATH}/jobOffline",
                data: "positionId=" + $(this).attr("name"),
                type: "POST",
                success: function () {
                    location.reload();
                }
            })
        }
    })

    <%--职位上线--%>
    $(".job_online").click(function () {
        $.ajax({
            url: "${APP_PATH}/jobOnline",
            data: "positionId=" + $(this).attr("name"),
            type: "POST",
            success: function () {
                alert("该职位上线成功！")
                location.reload();
            }
        })
    })

    <%--职位删除--%>
    $(".job_del").click(function () {
        var statu = confirm("确定要删除该职位吗？");
        if (!statu) {
            return false;
        } else {
            $.ajax({
                url: "${APP_PATH}/jobDel",
                data: "positionId=" + $(this).attr("name"),
                type: "POST",
                success: function () {
                    location.reload();
                }
            })
        }
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
</body>
</html>