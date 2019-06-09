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
                    <button class="layui-btn" onclick="xadmin.open('添加广告','ad_add',600,400)"><i class="layui-icon"></i>添加广告</button>
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

<script type="text/html" id="imgTpl">
    <a><img src="{{ d.adImg }}" style="width: 25px;height: 25px"></a>
</script>

<script type="text/html" id="isOnlineTpl">
    <input type="checkbox" name="online" value="{{d.adId}}" lay-skin="switch" lay-text="已上线|未上线" lay-filter="isOnline" {{ d.isOnline == '1' ? 'checked' : '' }}>
</script>

<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn layui-btn-xs" onclick="ad_edit('{{d.adId}}')"><i class="layui-icon"></i>编辑</button>
</script>
<script>


    $(function () {

        $.ajax({
            url: "${APP_PATH}/admin_adList",
            datatype: "JSON",
            success: function (result) {
                console.log(result)
                //加载广告列表
                ad_list(result);
            }
        })

    })

    function ad_list(result) {
        layui.use('table', function () {
            var table = layui.table;
            //方法级渲染
            table.render({
                elem: '#LAY_table_user'
                , cols: [[
                     {field: 'adId', align: 'center', title: 'ID', width: 80, sort: true, fixed: true}
                    , {field: 'adImg', align: 'center', title: '广告图', templet: '#imgTpl'}
                    , {field: 'adName', align: 'center', title: '广告名'}
                    , {field: 'adDescribe', align: 'center', title: '广告介绍'}
                    , {field: 'adSite', align: 'center', title: '广告链接'}
                    , {field: 'isOnline', align: 'center', title: '是否上线', templet:'#isOnlineTpl'}
                    , {fixed: 'right', width: 180, align: 'center', toolbar: '#barDemo', title: '操作'}
                ]]
                , id: 'testReload'
                , data: result.extend.ads
                , page: true
                , height: 450
            });
        });
    }


    layui.use(['laydate', 'form', 'table'], function () {
        var form = layui.form;

        layui.form.on('switch(isOnline)', function(obj){
            if (obj.elem.checked == true){
                $.ajax({
                    url:"${APP_PATH}/admin_adOnline",
                    data:{"adId":this.value,"isOnline":"1"},
                    success:function () {
                        layer.tips("已上线",obj.othis)
                    }
                })
            }else{
                $.ajax({
                    url:"${APP_PATH}/admin_adOnline",
                    data:{"adId":this.value,"isOnline":"0"},
                    success:function () {
                        layer.tips("已下线",obj.othis)
                    }
                })
            }
        });

    });


    function ad_edit(adId){
        xadmin.open('编辑','ad_edit?adId='+adId,600,550)
    }
</script>
</html>