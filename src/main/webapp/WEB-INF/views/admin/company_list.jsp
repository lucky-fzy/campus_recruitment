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
                <div class="layui-card-body">
                    <form class="layui-form layui-col-space5">
                        搜索：
                        <div class="layui-inline layui-show-xs-block">
                            <input id="search_val" type="text"  placeholder="请输入公司名" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button id="search_btn" class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                    <button class="layui-btn" onclick="xadmin.open('添加公司','comp_add',600,400)"><i class="layui-icon"></i>添加</button>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-hide" id="LAY_table_company" lay-filter="company"></table>
                </div>

            </div>
        </div>
    </div>
</div>
</body>

<%--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>
<script type="text/html" id="authenticationTpl">
    {{#  if(d.isAuthentication === '1'){ }}
    <button class="layui-btn layui-btn-sm">已认证</button>
    {{#  } else { }}
    <button class="layui-btn layui-btn-danger">未认证</button>
    {{#  } }}
</script>

<script type="text/html" id="imgTpl">
    <img src="{{ d.companyLogo }}" style="width: 25px;height: 25px">
</script>
<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn-danger" onclick="member_del('{{ d.companyId }}')"><i class="layui-icon"></i></button>
</script>
<script>


    $(function () {

        $.ajax({
            url:"${APP_PATH}/admin_companyList",
            datatype:"JSON",
            success:function (result) {
                console.log(result)
                //加载公司列表
                company_list(result);
            }
        })

    })

    function company_list(result){
        layui.use('table', function(){
            var table = layui.table;
            //方法级渲染
            table.render({
                elem: '#LAY_table_company'
                ,cols: [[
                    {checkbox: true, fixed: true}
                    ,{field:'companyId', title: 'ID', width:80, sort: true, fixed: true}
                    ,{field:'companyName',event:'setName', width:100, title: '公司名'}
                    ,{field:'allname',event:'setAllName', width:100, title: '公司全称'}
                    ,{field:'companyLogo', width:100, title: 'LOGO',align:'center',templet:"#imgTpl"}
                    ,{field:'companyCity',event:'setCity', width:100, title: '所在城市'}
                    ,{field:'companyPosition',event:'setPosition', width:100, title: '具体地址'}
                    ,{field:'companyWebsite',event:'setSite', width:100, title: '公司官网'}
                    ,{field:'field',event:'setField', width:100, title: '行业领域'}
                    ,{field:'scale', width:100, title: '规模'}
                    ,{field:'stage', width:100, title: '发展阶段'}
                    ,{field:'tag', width:100, title: '标签'}
                    ,{field:'companyDescribe', title: '公司简介'}
                    ,{field:'isAuthentication', title: '是否认证',align:'center', fixed: 'right', width:100, templet:"#authenticationTpl"}
                    ,{fixed: 'right', width:100, align:'center', templet: '#barDemo',title:'操作'}
                ]]
                ,id: 'testReload'
                ,data: result.extend.companys
                ,page: true
                ,height: 450
            });
        });
    }

    layui.use(['laydate','form','table'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;
        var table = layui.table;

        table.on('tool(company)', function(obj){
            var data = obj.data;
            if(obj.event === 'setName'){
                layer.prompt({
                    formType: 2
                    ,title: '修改公司名'
                    ,value: data.sign
                }, function(value, index){
                    $.ajax({
                        url:"admin_updateCompany",
                        data:{companyName:value,
                            companyId:data.companyId},
                        type:"POST",
                        success:function (result) {
                            layer.close(index);
                            company_list(result);
                        }
                    })
                });
            }
            if(obj.event === 'setAllName'){
                layer.prompt({
                    formType: 2
                    ,title: '修改公司全称'
                    ,value: data.sign
                }, function(value, index){
                    $.ajax({
                        url:"admin_updateCompany",
                        data:{allname:value,
                            companyId:data.companyId},
                        type:"POST",
                        success:function (result) {
                            layer.close(index);
                            company_list(result);
                        }
                    })
                });
            }
            if(obj.event === 'setCity'){
                layer.prompt({
                    formType: 2
                    ,title: '修改公司所在城市'
                    ,value: data.sign
                }, function(value, index){
                    $.ajax({
                        url:"admin_updateCompany",
                        data:{companyCity:value,
                            companyId:data.companyId},
                        type:"POST",
                        success:function (result) {
                            layer.close(index);
                            company_list(result);
                        }
                    })
                });
            }
            if(obj.event === 'setPosition'){
                layer.prompt({
                    formType: 2
                    ,title: '修改公司具体地址'
                    ,value: data.sign
                }, function(value, index){
                    $.ajax({
                        url:"admin_updateCompany",
                        data:{companyPosition:value,
                            companyId:data.companyId},
                        type:"POST",
                        success:function (result) {
                            layer.close(index);
                            company_list(result);
                        }
                    })
                });
            }
            if(obj.event === 'setSite'){
                layer.prompt({
                    formType: 2
                    ,title: '修改公司官网'
                    ,value: data.sign
                }, function(value, index){
                    $.ajax({
                        url:"admin_updateCompany",
                        data:{companyWebsite:value,
                            companyId:data.companyId},
                        type:"POST",
                        success:function (result) {
                            layer.close(index);
                            company_list(result);
                        }
                    })
                });
            }
            if(obj.event === 'setField'){
                layer.prompt({
                    formType: 2
                    ,title: '修改行业领域'
                    ,value: data.sign
                }, function(value, index){
                    $.ajax({
                        url:"admin_updateCompany",
                        data:{field:value,
                            companyId:data.companyId},
                        type:"POST",
                        success:function (result) {
                            layer.close(index);
                            company_list(result);
                        }
                    })
                });
            }
        });

        // 监听全选
        form.on('checkbox(checkall)', function(data){

            if(data.elem.checked){
                $('tbody input').prop('checked',true);
            }else{
                $('tbody input').prop('checked',false);
            }
            form.render('checkbox');
        });

        //监听提交
        form.on('submit(search)',
            function(data) {
                console.log(data);
                //发异步，把数据提交给后台
                var searchVal = $("#search_val").val();
                $.ajax({
                    url:"${APP_PATH}/search_company",
                    data:{"searchVal":searchVal},
                    type:"POST",
                    success:function (result) {
                        company_list(result);
                    }
                })
                return false;
            });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });


    /*用户-删除*/
    function member_del(id){
        layer.confirm('确认要删除吗？删除后其发布的职位也一并删除',function(index){
            //发异步删除数据
            $.ajax({
                url:"${APP_PATH}/admin_compDel",
                data:"companyId="+id,
                type:"POST",
                success:function (result) {
                    if (result.code == 100) {
                        layer.msg('已删除!',{icon:1,time:1000},function () {
                            company_list(result)
                        })
                    }
                }
            })
        });
    }



    function delAll () {
        var ids = [];
        // 获取选中的id
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
                ids.push($(this).parents("tr").children('td').eq(1).children().text())
            }
        });

        if (ids.length == 0){
            layer.alert("没有公司被选中！")
        }else{
            layer.confirm('确认要删除吗？删除后其发布的职位也一并删除',function(index){
                //捉到所有被选中的，发异步进行删除
                $.ajax({
                    url:"${APP_PATH}/admin_compsDel",
                    data:"compsIds="+ids,
                    type:"POST",
                    success:function (result) {
                        if (result.code == 100) {
                            layer.msg('已删除!',{icon:1,time:1000},function () {
                                company_list(result)
                            })
                        }
                    }
                })
            });
        }
    }

    //修改信息
    function comp_edit(compId){
        xadmin.open('编辑','comp_edit?compId='+compId,600,400)
    }

</script>
</html>