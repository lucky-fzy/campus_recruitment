<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <![endif]--></head>
    
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-form-mid layui-word-aux" style="font-size: 14px">
                            ${edit_emp.email}
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_empName" class="layui-form-label">
                            <span class="x-red">*</span>姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_empName" name="empName" value="${edit_emp.empName}" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_nickname" class="layui-form-label">
                            <span class="x-red">*</span>昵称</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_nickname" name="nickname" value="${edit_emp.nickname}" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>性别</label>
                        <div class="layui-input-inline">
                            <c:if test="${edit_emp.gender == 1}">
                                <input type="radio" name="gender" value="1" title="男" checked="">
                                <input type="radio" name="gender" value="0" title="女">
                            </c:if>
                            <c:if test="${edit_emp.gender == 0}">
                                <input type="radio" name="gender" value="1" title="男">
                                <input type="radio" name="gender" value="0" title="女" checked="">
                            </c:if>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_school" class="layui-form-label">
                            <span class="x-red">*</span>毕业院校</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_school" name="school" value="${edit_emp.school}" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <input type="hidden" value="${edit_emp.empId}" name="empId">
                        <button class="layui-btn" lay-filter="update" lay-submit="" style="display:block;margin:0 auto">修改</button></div>
                </form>
            </div>
        </div>
        <script>layui.use(['form', 'layer'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    nikename: function(value) {
                        if (value.length < 5) {
                            return '昵称至少得5个字符';
                        }
                    },

                });

                //监听提交
                form.on('submit(update)',
                function(data) {
                    console.log(data);
                    //发异步，把数据提交给后台
                    $.ajax({
                        url:"${APP_PATH}/admin_updateEmp",
                        data:$(".layui-form").serialize(),
                        type:"POST",
                        success:function (result) {
                            if (result.code == 100) {
                                layer.alert("修改成功", {
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