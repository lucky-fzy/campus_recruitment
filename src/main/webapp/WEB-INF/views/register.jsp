<%--
  Created by IntelliJ IDEA.
  User: 19653
  Date: 2019/3/14
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="alternate" media="handheld"  />
    <meta http-equiv="Content-Type" content="text/html;" charset="utf-8">
    <title>注册-校园招-最专业的大学生实习招聘平台</title>
    <link rel="stylesheet" type="text/css" href="style/css/style.css"/>
    <script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
    <script type="text/javascript" src="style/js/core.min.js"></script>

    <%--<link href="${APP_PATH}/style/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<script src="${APP_PATH}/style/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>

</head>

<body id="login_bg">

<%--<div class="modal fade" id="goModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">--%>
    <%--<div class="modal-dialog" role="document">--%>
        <%--<div class="modal-content">--%>
            <%--<div class="modal-header">--%>
                <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                <%--<h4 class="modal-title">恭喜您注册成功！</h4>--%>
            <%--</div>--%>

            <%--<div class="modal-footer">--%>
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                <%--<a href="login"><button type="button" class="btn btn-primary" id="go_login">去登录</button></a>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<div class="login_wrapper">
    <div class="login_header">
        <a href="home"><img src="style/images/logo_white.png" width="285" height="62" alt="校园招" /></a>
        <div id="cloud_s"><img src="style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
        <div id="cloud_m"><img src="style/images/cloud_m.png" width="136" height="95"  alt="cloud" /></div>
    </div>

    <div class="login_box">
        <form id="loginForm">
            <ul class="register_radio clearfix">
                <li>
                    找工作
                    <input type="radio" value="0" name="type" />
                </li>
                <li>
                    招人
                    <input type="radio" value="1" name="type" />
                </li>
            </ul>
            <input type="text" style="width: 316px;height: 42px" id="email" name="email" tabindex="1" placeholder="请输入常用邮箱地址" />
            <span for="email" generated="true" class="error" id="email_msg"></span>
            <span class="error" style="display:none;" id="beError"></span>
            <input type="password" style="width: 316px;height: 42px" id="password" name="password" tabindex="2" placeholder="请输入密码" />
            <label class="fl registerJianJu" for="checkbox">
                <input type="checkbox" id="checkbox" name="checkbox" checked  class="checkbox valid" />我已阅读并同意<a>《校园招用户协议》</a>
            </label>
            <input type="button" class="submitLogin" id="register_btn" value="注 &nbsp; &nbsp; 册" />
            <a href="home"  style="float: left;margin-left: 40px"><input type="button" class="submitLogin" value="取 &nbsp; &nbsp; 消" /></a>
        </form>
        <div class="login_right">
            <div>已有帐号</div>
            <a href="login" class="registor_now">直接登录</a>
        </div>
    </div>
    <div class="login_box_btm"></div>
</div>

<script type="text/javascript">

    $(document).ready(function(e) {

        $('.register_radio li input').click(function(e){
            $(this).parent('li').addClass('current').append('<em></em>').siblings().removeClass('current').find('em').remove();
        });

        $('#email').focus(function(){
            $('#beError').hide();
        });
        //验证表单
        $("#loginForm").validate({
            rules: {
                type:{
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true,
                    rangelength: [6,16]
                },
                checkbox:{required:true}
            },
            messages: {
                type:{
                    required:"请选择使用校园招的目的"
                },
                email: {
                    required: "请输入常用邮箱地址",
                    email: "请输入有效的邮箱地址，如：xxx@163.com"
                },
                password: {
                    required: "请输入密码",
                    rangelength: "请输入6-16位密码，字母区分大小写"
                },
                checkbox: {
                    required: "请接受校园招用户协议"
                }
            },
            errorPlacement:function(label, element){/*
			    		if(element.attr("type") == "radio"){
			    			label.insertAfter($(element).parents('ul')).css('marginTop','-20px');
			    		}else if(element.attr("type") == "checkbox"){
			    			label.inserresult.contenttAfter($(element).parent()).css('clear','left');
			    		}else{
			    			label.insertAfter(element);
			    		} */
                /*modify nancy*/
                if(element.attr("type") == "radio"){
                    label.insertAfter($(element).parents('ul')).css('marginTop','-20px');
                }else if(element.attr("type") == "checkbox"){
                    label.insertAfter($(element).parent()).css('clear','left');
                }else{
                    label.insertAfter(element);
                };
            },

        });
    });


    //校验邮箱是否可用
    $("#email").change(function () {
        //发送ajax请求校验用户名是否可用
        $("#email_msg").empty();
        var email = this.value;
        var type = $("input[type='radio']:checked").val();
        $.ajax({
            url:"${APP_PATH}/checkemail",
            data:"email="+ email +"&type="+ type,
            type:"POST",
            success:function (result) {
                if (result.code == 200){
                    $("#email_msg").show().append("该邮箱已被注册！");
                    $("#password").attr("readonly",true);
                }else{
                    $("#password").removeAttr("readonly");
                }
            }
        })
    })

    $("#register_btn").click(function () {
        var email = $("#email").val();
        var psd = $("#password").val();
        var type = $("input[type='radio']:checked").val();
        //发送ajax请求，把注册信息插入数据库
        $.ajax({
            url:"${APP_PATH}/addEmp",
            data:"email="+ email + "&password="+ psd +"&type="+ type,
            type:"POST",
            success:function (result) {
                if (result.code == 100 && type==0){
                    $("#email").val("");
                    $("#password").val("");
                    // $("#goModal").modal({
                    //     backdrop:"static"
                    // });
                    alert("注册成功，立即登录");
                    location.href='login'

                }else if (result.code == 100 && type==1){
                    window.location.href="bindstep1"
                }
            }
        })
    })

</script>
</body>
</html>

