<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 19653
  Date: 2019/2/9
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML>
<html>
<head>

    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="alternate" media="handheld"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登录-校园招-最专业的大学生实习招聘平台</title>

    <link rel="stylesheet" type="text/css" href="style/css/style.css"/>
    <script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
    <script type="text/javascript" src="style/js/core.min.js"></script>

</head>

<body id="login_bg">
<div class="login_wrapper">
    <div class="login_header">
        <a href="h/"><img src="style/images/logo_white.png" width="285" height="62" alt="校园招" /></a>
        <div id="cloud_s"><img src="style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
        <div id="cloud_m"><img src="style/images/cloud_m.png" width="136" height="95"  alt="cloud" /></div>
    </div>

    <input type="hidden" id="resubmitToken" value="" />
    <div class="login_box">
        <form id="loginForm" action="loginValidate" method="post">
            <input type="text" id="email" name="email" value="" tabindex="1" placeholder="请输入登录邮箱地址" />
            <c:if test="${msg == '该账号尚未注册，请先注册！'}">
                <span for="email" generated="true" class="error">${msg}</span>
            </c:if>
            <input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码" />
            <c:if test="${msg == '密码不正确！'}">
                <span for="email" generated="true" class="error">${msg}</span>
            </c:if>
            <input type="hidden" id="login_val" name="type" value="0"/>
            <span class="error" style="display:none;" id="beError"></span>

            <input type="submit" id="login_btn" class="submitLogin" value="登 &nbsp; &nbsp; 录" />
            <a href="home"  style="float: left;margin-left: 50px"><input type="button" class="submitLogin" value="取 &nbsp; &nbsp; 消" /></a>
        </form>
        <div class="login_right">
            <div>还没有帐号？</div>
            <a  href="register"  class="registor_now">立即注册</a>
            <div>
                <a  class="registor_now" style="font-size: 25px;margin-top: 50px" id="login_type">公司登录</a>
            </div>
        </div>
    </div>
    <div class="login_box_btm"></div>
</div>

<script type="text/javascript">
    $(function(){
        //验证表单
        $("#loginForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true
                }
            },
            messages: {
                email: {
                    required: "请输入登录邮箱地址",
                    email: "请输入有效的邮箱地址，如：xxx@163.com"
                },
                password: {
                    required: "请输入密码"
                }
            }
        });

        $("#login_type").click(function () {
            if ($("#login_val").val() == 0){
                $("#login_val").val("1")
                $("#login_type").text("求职者登录");
            }else{
                $("#login_val").val("0")
                $("#login_type").text("公司登录");
            }
        })

    })
</script>
</body>
</html>