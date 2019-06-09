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
        <script type="text/javascript" src="${APP_PATH}/style/admin/lib/layui/lay/modules/upload.js"></script>
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
                        <label for="L_adName" class="layui-form-label">
                            <span class="x-red">*</span>广告名</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_adName" name="adName" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_adDescribe" class="layui-form-label">
                            <span class="x-red">*</span>广告介绍</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_adDescribe" name="adDescribe" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_adSite" class="layui-form-label">
                            <span class="x-red">*</span>广告链接</label>
                        <div class="layui-input-inline">
                            <input type="text" id="L_adSite" name="adSite" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>广告图片</label>
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="test1">上传图片</button>
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="demo1">
                                <p id="demoText"></p>
                            </div>
                        </div>
                        <input type="hidden" value="" name="adImg" id="adImg">
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"></label>
                        <button class="layui-btn" lay-filter="add" lay-submit="" style="display:block;margin:0 auto">增加</button></div>
                </form>
            </div>
        </div>

        <script>layui.use(['form', 'layer','jquery','upload'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                var upload = layui.upload;

                var uploadInst = upload.render({
                    elem: '#test1'
                    ,url: 'ad_upload'
                    ,accept: 'images'
                    ,before: function(obj){
                        //预读本地文件示例，不支持ie8
                        obj.preview(function(index, file, result){
                            $('#demo1').attr('src', result); //图片链接（base64）
                        });
                    }
                    ,done: function(res){
                        if (res.success){
                            $('#adImg').val(res.url);
                            layer.msg("上传成功")
                        }
                    }
                    ,error: function(){
                        //演示失败状态，并实现重传
                        var demoText = $('#demoText');
                        demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                        demoText.find('.demo-reload').on('click', function(){
                            uploadInst.upload();
                        });
                    }
                });

                //监听提交
                form.on('submit(add)',
                function(data) {
                    console.log(data);
                    //发异步，把数据提交给后台
                    $.ajax({
                        url:"${APP_PATH}/admin_addAd",
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
    </body>

</html>