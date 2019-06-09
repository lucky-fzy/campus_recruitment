<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${APP_PATH}/style/admin/css/font.css">
    <link rel="stylesheet" href="${APP_PATH}/style/admin/css/xadmin.css">
    <script type="text/javascript" src="${APP_PATH}/style/admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${APP_PATH}/style/admin/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--></head>

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-form-mid layui-word-aux" style="font-size: 14px">
                    ${edit_emp.empName}
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_oldpass" class="layui-form-label">
                    <span class="x-red">*</span>旧密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="L_oldpass" name="oldpass" required="" lay-verify="oldpass"
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">
                    <span class="x-red">*</span>新密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="L_pass" name="pwd" required="" lay-verify="pass" autocomplete="off"
                           class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">6到12个字符</div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    <span class="x-red">*</span>确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="L_repass" name="repass" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <input type="hidden" value="${edit_emp.empId}" name="empId">
                <button class="layui-btn" lay-filter="save" lay-submit="">修改</button>
            </div>
        </form>
    </div>
</div>
<script>layui.use(['form', 'layer', 'jquery'],
    function () {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            oldpass: function (value) {
                if (value != "${edit_emp.pwd}") {
                    return '原密码不正确！';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            repass: function (value) {
                if ($('#L_pass').val() != $('#L_repass').val()) {
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(save)',
            function (data) {
                console.log(data);
                //发异步，把数据提交给后台
                $.ajax({
                    url: "${APP_PATH}/admin_updatePwd",
                    data: $(".layui-form").serialize(),
                    type: "POST",
                    success: function (result) {
                        if (result.code == 100) {
                            layer.alert("修改成功", {
                                    icon: 6
                                },
                                function () {
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
<script>var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>