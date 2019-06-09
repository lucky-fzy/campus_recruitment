<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
    <script type="text/javascript" async="" src="style/js/conversion.js"></script>
    <script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>

    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>校园招-最专业的大学生实习招聘平台</title>
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
                <dd class="current">
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
        </div><!-- end .sidebar -->
        <div class="content">
            <dl class="company_center_content">
                <dt>
                    <h1>
                        <em></em>
                        待处理简历 <span>（共${selectResumes.size()}份）</span></h1>
                </dt>
                <dd>
                    <form id="resume" method="post" action="selectResume">
                        <div class="filter_actions">
                            <label class="checkbox">
                                <input type="checkbox">
                                <i></i>
                            </label>
                            <span>全选</span>
                            <a id="resumeCanInterviewAll">待定</a>
                            <div id="filter_btn" class="">筛选简历 <em class=""></em></div>
                        </div><!-- end .filter_actions -->
                        <div class="filter_options  dn " style="display: none;">
                            <dl class="degree">
                                <dt>最低学历：</dt>
                                <dd>
                                    <a rel="-1" class="current">不限</a>
                                    <a rel="1">大专</a>
                                    <a rel="2">本科</a>
                                    <a rel="3">硕士</a>
                                    <a rel="4">博士</a>
                                    <input type="hidden" value="${degree}" name="degree" id="degree">
                                </dd>
                            </dl>
                            <dl class="position">
                                <dt>招聘职位：</dt>
                                <dd>
                                    <a rel="-1" class="current" positionId = 0>不限</a>
                                    <c:forEach items="${recruitPosition}" var="position">
                                        <a positionId="${position.positionId}">${position.positionName}</a>
                                    </c:forEach>
                                    <input type="hidden" value="${positionId}" name="positionId" id="positionId">
                                </dd>
                            </dl>
                            <input type="hidden" value="0" name="type">
                        </div><!-- end .filter_options -->

                        <div id="resume_list">
                            <ul class="reset resumeLists">
                                <c:forEach items="${selectResumes}" var="resumes">
                                    <li class="onlineResume" data-id="${resumes.toudiId}">
                                        <label class="checkbox">
                                            <input type="checkbox">
                                            <i></i>
                                        </label>
                                        <div class="resumeShow">
                                            <a title="预览简历" target="_blank" class="resumeImg"
                                               href="resumeView?resumeId=${resumes.resume.resumeId}">
                                                <img src="${resumes.resume.photo}">
                                            </a>
                                            <div class="resumeIntro">
                                                <h3 class="unread">
                                                    <a target="_blank" title="预览${resumes.resume.emp.empName}的简历"
                                                       href="resumeView?resumeId=${resumes.resume.resumeId}">
                                                            ${resumes.resume.emp.empName}的简历
                                                    </a>
                                                    <em></em>
                                                </h3>
                                                <span class="fr">投递时间：${resumes.toudiDate}</span>
                                                <div>
                                                        ${resumes.resume.emp.empName} / <c:if
                                                        test="${resumes.resume.emp.gender == 1}">男</c:if>
                                                    <c:if test="${resumes.resume.emp.gender == 0}">女</c:if>
                                                    / ${resumes.resume.degree} / ${resumes.resume.city} <br>
                                                        ${resumes.resume.position} | ${resumes.resume.emp.school}
                                                    · ${resumes.resume.major}
                                                </div>
                                                <div class="jdpublisher">
				                                        <span>
				                                        	应聘职位：<a title="${resumes.resume.position}" target="_blank"
                                                                    href="">${resumes.resume.position}</a>
				                                       						                                        </span>
                                                </div>
                                            </div>
                                            <div class="links">
                                                <a class="resume_notice" toudiId="${resumes.toudiId}">通知面试</a>
                                                <a class="resume_refuse" toudiId="${resumes.toudiId}">不合适</a>
                                                <a class="resume_caninterview" toudiId="${resumes.toudiId}">待定</a>
                                            </div>
                                        </div>
                                        <div class="contactInfo">
                                            <span class="c9">电话：</span>${resumes.resume.phone} &nbsp;&nbsp;&nbsp;
                                            <span class="c9">邮箱：</span><a
                                                href="${resumes.resume.emp.email}">${resumes.resume.emp.email}</a>
                                        </div>
                                    </li>
                                </c:forEach>

                            </ul><!-- end .resumeLists -->
                        </div>

                    </form>
                </dd>
            </dl><!-- end .company_center_content -->
        </div><!-- end .content -->

        <!------------------------------------- end ----------------------------------------->
        <script src="style/js/jquery.ui.datetimepicker.min.js" type="text/javascript"></script>
        <script src="style/js/received_resumes.min.js" type="text/javascript"></script>
        <script>
        </script>
        <div class="clear"></div>
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

<script>

    $(function () {
        $.each($(".degree a"), function () {
            if ($(this).text() == $("#degree").val()) {
                $(".degree a").removeClass("current")
                $(this).addClass("current")
            }
        })

        $.each($(".position a"), function () {
            if ($(this).attr("positionId") == $("#positionId").val()) {
                $(".position a").removeClass("current")
                $(this).addClass("current")
            }
        })
    })

    function show_resume(resumes) {
        var list = "";
        $.each(resumes, function () {
            var li = "<li class='onlineResume' data-id='" + this.toudiId + "'>" +
                "<label class='checkbox'>" +
                "<input type='checkbox'>" +
                "<li></li>" +
                "</lable>" +
                "<div class='resumeShow'>" +
                "<a title='预览简历' target='_blank' class='resumeImg' href='resumeView?resumeId=" + this.resume.resumeId + "'>" +
                "<img src='style/images/" + this.resume.photo + "'>" +
                "</a>" +
                "<div class='resumeIntro'>" +
                "<h3 class='unread'>" +
                "<a target='_blank' title='预览" + this.resume.emp.empName + "的简历' href='resumeView?resumeId=" + this.resume.resumeId + "'>" +
                this.resume.emp.empName + " 的简历 " +
                "</a>" +
                "<em></em>" +
                "</h3>" +
                "<span class='fr'>投递时间：" + this.toudiDate + "</span>" +
                "<div>" +
                this.resume.emp.empName + "/";

            if (this.resume.emp.gender == 1) {
                li += "男 /"
            } else {
                li += "女 /"
            }
            li += this.resume.degree + " /" +
                this.resume.city + "<br>" +
                this.resume.position + " | " +
                this.resume.emp.school + "·" +
                this.resume.major + "" +
                "</div>" +
                "<div class='jdpublisher'>" +
                "<span>应聘职位：" +
                "<a title='" + this.resume.position + "' target='_blank'>" + this.resume.position + "</a>" +
                "</span>" +
                "</div>" +
                "</div>" +
                "<div class='links'>" +
                "<a class='resume_notice' toudiId='" + this.toudiId + "'>通知面试" + "</a>" +
                "<a class='resume_refuse' toudiId='" + this.toudiId + "'>不合适" + "</a>" +
                "<a class='resume_caninterview' toudiId='" + this.toudiId + "'>待定" + "</a>" +
                "</div>" +
                "</div>" +
                "<div class='contactInfo'>" +
                "<span class='c9'>电话：</span>" + this.resume.phone + "&nbsp;&nbsp;&nbsp;" +
                "<span class='c9'>邮箱：</span>" + this.resume.emp.email + "&nbsp;&nbsp;&nbsp;" + "" +
                "</div>" +
                "</li>";
            list += li;
        })
        var ul = "<ul  class='reset resumeLists'>" + list + "</ul>"
        $("#resume_list").html(ul);


    }

    function find_degree() {
        var degree = "";
        $.each($(".degree a"), function () {
            if ($(this).hasClass("current")) {
                degree = $(this).text()
            }
        })
        return degree;
    }

    function find_position() {
        var position = 0;
        $.each($(".position a"), function () {
            if ($(this).hasClass("current")) {
                position = $(this).attr("positionId")
            }
        })
        return position;
    }

    $(".degree a").on('click',function () {

        if ($(this).hasClass("current")) {
            $(this).removeClass("current")
        } else {
            $(".degree a").removeClass("current")
            $(this).addClass("current")
        }


        var degree = find_degree();
        var position = find_position();
        $("#degree").val(degree);
        $("#positionId").val(position);
        $("#resume").submit();
        // $.ajax({
        //     url: "select_resume",
        //     data: {degree: degree, positionId: position, type: 0},
        //     type: "POST",
        //     success: function (result) {
        //         show_resume(result.extend.toudis);
        //     }
        // })
    })

    $(".position a").on('click',function () {
        if ($(this).hasClass("current")) {
            $(this).removeClass("current")
        } else {
            $(".position a").removeClass("current")
            $(this).addClass("current")
        }
        var degree = find_degree();
        var position = find_position();
        $("#degree").val(degree);
        $("#positionId").val(position);
        $("#resume").submit();
    })

    <%--通知面试--%>
    $(".resume_notice").on('click', function () {
        alert(456)
        $.ajax({
            url: "${APP_PATH}/resume_notice",
            data: "toudiId=" + $(this).attr("toudiId"),
            type: "POST",
            success: function () {
                alert("面试通知已发送成功,该简历已进入“已通知面试简历”列表");
                location.reload();
            }
        })
    })

    //职位不合适通知
    $(".resume_refuse").click(function () {
        var statu = confirm("确认这份简历不合适吗？");
        if (!statu) {
            return false;
        } else {
            $.ajax({
                url: "${APP_PATH}/resume_refuse",
                data: "toudiId=" + $(this).attr("toudiId"),
                type: "POST",
                success: function () {
                    location.reload();
                }
            })
        }
    })

    //批量待定
    $("#resumeCanInterviewAll").click(function () {
        var a = new Array;

        $(".resumeLists li").each(function () {
            $(this).find('input[type="checkbox"]').attr("checked") && a.push($(this).attr("data-id"))
        })

        a = a.join(",");
        if (a == "") {
            alert("请选择要标记的简历");
        } else {
            if (confirm("确定要标记选中的简历为待定简历吗？")) {
                $.ajax({
                    type: "POST",
                    url: "${APP_PATH}/resumeCanInterviewAll",
                    data: "toudiIds=" + a,
                    success: function () {
                        location.reload();
                    }
                })
            }
        }
    })

    $(".resume_caninterview").click(function () {
        $.ajax({
            url: "${APP_PATH}/resume_caninterview",
            data: "toudiId=" + $(this).attr("toudiId"),
            type: "POST",
            success: function () {
                location.reload();
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