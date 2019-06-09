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
                        <label class="layui-form-label">职位类别</label>
                        <div class="layui-input-inline layui-show-xs-block" style="width: 100px">
                            <input type="hidden" id="hidden_type" value="${edit_position.positionType}">
                            <select name="positionType" id="positionType">
                                <c:forEach items="${positionType}" var="positiontype">
                                    <option value="${positiontype.midName}">${positiontype.midName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_positionName" class="layui-form-label">
                            <span class="x-red">*</span>职位名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_positionName" name="positionName" value="${edit_position.positionName}" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_department" class="layui-form-label">
                            <span class="x-red">*</span>部门</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_department" name="department" value="${edit_position.department}" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>工作类型</label>
                        <div class="layui-input-inline">
                            <c:if test="${edit_position.jobType == '全职'}">
                                <input type="radio" name="jobType" value="全职" title="全职" checked="">
                                <input type="radio" name="jobType" value="实习" title="实习">
                            </c:if>
                            <c:if test="${edit_position.jobType == '实习'}">
                                <input type="radio" name="jobType" value="全职" title="全职">
                                <input type="radio" name="jobType" value="实习" title="实习" checked="">
                            </c:if>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_jobCity" class="layui-form-label">
                            <span class="x-red">*</span>工作城市</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_jobCity" name="jobCity" value="${edit_position.jobCity}" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_jobCity" class="layui-form-label">
                            <span class="x-red">*</span>学历要求</label>
                        <div class="layui-input-inline layui-show-xs-block" style="width: 100px">
                            <input type="hidden" value="${edit_position.degree}" id="hidden_degree">
                            <select name="degree" id="degree">
                                <option value="不限">不限</option>
                                <option value="大专">大专</option>
                                <option value="本科">本科</option>
                                <option value="硕士">硕士</option>
                                <option value="博士">博士</option>
                            </select>
                            <script>
                                window.onload=function () {
                                    $("#degree option").each(function () {
                                        if ($(this).val() == $("#hidden_degree").val()) {
                                            $(this).attr("selected",true);
                                            $(".layui-unselect[readonly]:eq(1)").val($(this).val())
                                        }
                                    })
                                    $("#positionType option").each(function () {
                                        if ($(this).val() == $("#hidden_type").val()) {
                                            $(this).attr("selected",true);
                                            $(".layui-unselect[readonly]:eq(0)").val($(this).val())
                                        }
                                    })
                                }
                            </script>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_positionDescribe" class="layui-form-label">
                            <span class="x-red">*</span>职责描述</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_positionDescribe" name="positionDescribe" value="${edit_position.positionDescribe}" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>薪资</label>
                        <div class="layui-input-inline">
                            <input style="width: 50px;display: inline" type="text" name="minSalary" value="${edit_position.minSalary}" required="" lay-verify="required" autocomplete="off" class="layui-input">k
                            -
                            <input style="width: 50px;display: inline" type="text" name="maxSalary" value="${edit_position.maxSalary}" required="" lay-verify="required" autocomplete="off" class="layui-input">k
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <input type="hidden" value="${edit_position.positionId}" name="positionId">
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
                        url:"${APP_PATH}/admin_updatePosition",
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