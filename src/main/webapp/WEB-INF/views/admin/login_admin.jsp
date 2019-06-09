<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>后台登录</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${APP_PATH}/style/admin/css/font.css">
    <link rel="stylesheet" href="${APP_PATH}/style/admin/css/login.css">
    <link rel="stylesheet" href="${APP_PATH}/style/admin/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${APP_PATH}/style/admin/lib/layui/layui.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">校园招管理员登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" >
            <input id="username" name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input id="password" name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

    <script>
        $(function  () {
            layui.use('form', function(){
              var form = layui.form;

              //监听提交
              form.on('submit(login)', function(data){
                  var adminName = $("#username").val();
                  var adminPwd = $("#password").val();
                $.ajax({
                    url:"checkAdmin",
                    data:{adminName:adminName,
                            adminPwd:adminPwd},
                    type:"POST",
                    success:function (result) {
                        if (result.code == 100){
                            layer.msg('登录成功',{icon:1,time:500},function () {
                                location.href='admin'
                            })
                        }else {
                            layer.msg("登录失败",function () {
                                location.reload()
                            })
                        }
                    }
                })
                return false;
              });
            });
        })
    </script>
    <!-- 底部结束 -->

</body>
</html>