<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="${APP_PATH}/style/admin/css/font.css">
        <link rel="stylesheet" href="${APP_PATH}/style/admin/css/xadmin.css">
        <script type="text/javascript" src="${APP_PATH}/style/admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${APP_PATH}/style/admin/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            公司邮箱
                        </label>
                        ${company.companyEmail}
                    <div class="layui-form-item">
                        <label for="L_companyName" class="layui-form-label">
                            <span class="x-red">*</span>公司名</label>
                        <div class="layui-input-inline">
                            <input type="text" value="${company.companyName}" id="L_companyName" name="companyName" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_allname" class="layui-form-label">
                            <span class="x-red">*</span>公司全称</label>
                        <div class="layui-input-inline">
                            <input type="text" value="${company.allname}" id="L_allname" name="allname" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                        <div class="layui-form-item">
                            <label for="L_companyCity" class="layui-form-label">
                                <span class="x-red">*</span>所在城市</label>
                            <div class="layui-input-inline">
                                <input type="text" value="${company.companyCity}" id="L_companyCity" name="companyCity" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_companyCity" class="layui-form-label">
                                <span class="x-red">*</span>所在城市</label>
                            <div class="layui-input-inline">
                                <input type="text" value="${company.companyCity}" id="L_companyCity" name="companyCity" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                        </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"></label>
                        <button class="layui-btn" lay-filter="add" lay-submit="" style="display:block;margin:0 auto">增加</button></div>
                </form>
            </div>
        </div>

        <script>
            //校验邮箱是否可用
            $("#L_email").change(function () {
                //发送ajax请求校验用户名是否可用
                var email = this.value;
                $.ajax({
                    url:"${APP_PATH}/checkEmp",
                    data:"email="+ email,
                    type:"POST",
                    success:function (result) {
                        if (result.code == 200){

                        }
                    }
                })
            })
        </script>

        <script>layui.use(['form', 'layer','jquery'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    pass: [/(.+){6,12}$/, '密码必须6到12位'],
                    repass: function(value) {
                        if ($('#L_pass').val() != $('#L_repass').val()) {
                            return '两次密码不一致';
                        }
                    }
                });

                //监听提交
                form.on('submit(add)',
                function(data) {
                    console.log(data);
                    //发异步，把数据提交给后台
                    $.ajax({
                        url:"${APP_PATH}/admin_addComp",
                        data:$(".layui-form").serialize(),
                        type:"POST",
                        success:function (result) {
                            if (result.code == 100) {
                                layer.alert("增加成功", {
                                        icon: 6
                                    },
                                    function() {
                                        //关闭当前frame
                                        xadmin.close();
                                        // 可以对父窗口进行刷新
                                        xadmin.father_reload();
                                    });
                            }
                        }
                    })

                    return false;
                });

            });</script>
        <script>var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>