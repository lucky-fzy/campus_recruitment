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
        <![endif]-->
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form layui-col-md12  layui-form-pane">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><span class="x-red">*</span>一级职位</label>
                        <div class="layui-input-inline">
                            <select name="bigId" lay-verify="required" lay-filter="bigClass">
                                <c:forEach items="${bigClasses}" var="bigClass">
                                    <c:if test="${bigClass.bigId == midClass.bigId}">
                                        <option value="${bigClass.bigId}" selected>${bigClass.bigName}</option>
                                    </c:if>
                                    <c:if test="${bigClass.bigId != midClass.bigId}">
                                        <option value="${bigClass.bigId}">${bigClass.bigName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><span class="x-red">*</span>二级职位</label>
                        <div class="layui-input-inline">
                            <select name="midId" lay-filter="midClass" lay-verify="required" id="midClass">
                                <c:forEach items="${midClasses}" var="mid">
                                    <c:if test="${midClass.midId == mid.midId}">
                                        <option value="${mid.midId}" selected>${mid.midName}</option>
                                    </c:if>
                                    <c:if test="${midClass.midId != mid.midId}">
                                        <option value="${mid.bigId}">${mid.midName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><span class="x-red">*</span>三级职位</label>
                        <div class="layui-input-inline">
                            <input type="text" name="smallName" value="${smallClass.smallName}" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div><br><br><br>
                    <div class="layui-form-item">
                        <input type="hidden" name="smallId" value="${smallClass.smallId}">
                        <button class="layui-btn" lay-filter="update" lay-submit="" style="display:block;margin:0 auto">修改</button>
                    </div>
                </form>
            </div>
        </div>

        <script>layui.use(['form', 'layer','jquery'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //监听一级职位的选择
                form.on('select(bigClass)',function (data) {
                    console.log(data)
                    var bigId = data.value;
                    $.ajax({
                        url:"${APP_PATH}/selectMidClass",
                        data:"bigId="+bigId,
                        type:"POST",
                        success:function (result) {
                            console.log(result)
                            var data = result.extend.midClasses;
                            $("#midClass").html("");
                            for(var x in data){
                                var option1 = $("<option>").val(data[x].midId).text(data[x].midName).addClass("midClass");
                                $("#midClass").append(option1);
                            }
                            form.render('select');
                        }
                    })
                })

                //监听提交
                form.on('submit(update)',
                function(data) {
                    console.log(data);
                    //发异步，把数据提交给后台
                    $.ajax({
                        url:"${APP_PATH}/admin_updateClass",
                        data:{  "midId":data.field.midId,
                                "smallId":data.field.smallId,
                                "smallName":data.field.smallName},
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

            });
        </script>
    </body>

</html>