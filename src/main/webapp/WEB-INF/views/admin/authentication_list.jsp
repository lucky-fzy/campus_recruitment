<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="${APP_PATH}/style/admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${APP_PATH}/style/admin/js/xadmin.js"></script>
    <script type="text/javascript" src="${APP_PATH}/style/admin/js/jquery.min.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="authAll()"><i class="layui-icon"></i>批量通过
                    </button>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>


<%--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>

<script type="text/html" id="companyNameTpl">
    {{d.company.companyName}}
</script>

<script type="text/html" id="licenseTpl">
    <a href="{{ d.license }}"><img src="{{ d.license }}" style="width: 25px;height: 25px"></a>
</script>

<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn-normal" style="width: 80px"
            onclick="isAuth('{{d.companyId}}','{{d.authenticationId}}','ok')">通过
    </button>
    <button class="layui-btn layui-btn-danger" style="width: 80px"
            onclick="isAuth('{{d.companyId}}','{{d.authenticationId}}','no')">不通过
    </button>
</script>
<script>


    $(function () {

        $.ajax({
            url: "${APP_PATH}/admin_authenticationList",
            datatype: "JSON",
            success: function (result) {
                console.log(result)
                //加载求职者列表
                auth_list(result);
            }
        })

    })

    function auth_list(result) {
        layui.use('table', function () {
            var table = layui.table;
            //方法级渲染
            table.render({
                elem: '#LAY_table_user'
                , cols: [[
                    {checkbox: true, fixed: true}
                    , {field: 'authenticationId', align: 'center', title: 'ID', width: 80, sort: true, fixed: true}
                    , {field: 'companyId', align: 'center', title: '公司名', templet: '#companyNameTpl'}
                    , {field: 'license', align: 'center', title: '营业执照', templet: '#licenseTpl'}
                    , {field: 'authDate', align: 'center', title: '申请时间', sort: true}
                    , {fixed: 'right', width: 250, align: 'center', toolbar: '#barDemo', title: '是否通过'}
                ]]
                , id: 'testReload'
                , data: result.extend.auths
                , page: true
                , height: 450
            });
        });
    }


    layui.use(['laydate', 'form', 'table'], function () {
        var form = layui.form;

        // 监听全选
        form.on('checkbox(checkall)', function (data) {

            if (data.elem.checked) {
                $('tbody input').prop('checked', true);
            } else {
                $('tbody input').prop('checked', false);
            }
            form.render('checkbox');
        });

    });


    function authAll() {
        var ids = [];

        // 获取选中的id
        $('tbody input').each(function (index, el) {
            if ($(this).prop('checked')) {
                ids.push($(this).parents("tr").children('td').eq(1).children().text())
            }
        });

        if (ids.length == 0) {
            layer.alert("没有申请被选中！")
        } else {
            $.ajax({
                url: "${APP_PATH}/authAll",
                data: "authIds=" + ids,
                type: "POST",
                success: function (result) {
                    if (result.code == 100) {
                        layer.msg('已审核通过!', {icon: 1, time: 1000}, function () {
                            auth_list(result);
                        })
                    }
                }
            })
        }
    }

    function isAuth(companyId, authenticationId, type) {
        $.ajax({
            url: "isAuth",
            data: {companyId: companyId, authenticationId: authenticationId, type: type},
            type: "POST",
            success: function (result) {
                if (result.extend.isAuth == "ok") {
                    layer.msg('已审核通过!', {icon: 1, time: 1000}, function () {
                        auth_list(result);
                    })
                }else {
                    layer.msg('审核不通过，已清除该申请!', {icon: 1, time: 1000}, function () {
                        auth_list(result);
                    })
                }
            }
        })
    }
</script>
</html>