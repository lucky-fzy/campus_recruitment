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
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                    <button class="layui-btn" onclick="xadmin.open('添加职位','smallClass_add',400,300)"><i class="layui-icon"></i>添加</button>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-hide" id="LAY_table_position" lay-filter="position"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>


<%--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>

<script type="text/html" id="midName">
    {{d.midClass.midName}}
</script>

<script type="text/html" id="bigName">
    {{d.midClass.bigClass.bigName}}
</script>

<script type="text/html" id="hotTpl">
    <input type="checkbox" name="hot" value="{{d.smallId}}" lay-skin="switch" lay-text="热门|非热门" lay-filter="ishot" {{ d.ishot == '1' ? 'checked' : '' }}>
</script>

<script type="text/html" id="barDemo">
    <a onclick="class_edit('{{ d.smallId }}')" title="编辑" href="javascript:;" class="edit_emp">
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a title="删除" onclick="member_del('{{ d.smallId }}')" href="javascript:;">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>
<script>


    $(function () {

        $.ajax({
            url:"${APP_PATH}/admin_jobClass",
            datatype:"JSON",
            success:function (result) {
                console.log(result)
                //加载职位列表
                jobClass_list(result);
            }
        })

    })

    function jobClass_list(result){
        layui.use('table', function(){
            var table = layui.table;
            //方法级渲染
            table.render({
                elem: '#LAY_table_position'
                ,cols: [[
                    {checkbox: true, fixed: true}
                    ,{field:'smallId',align:'center', title: 'ID', width:80, sort: true, fixed: true}
                    ,{field:'midClass.bigClass.bigName',align:'center', title: '一级职位', templet:"#bigName"}
                    ,{field:'midClass.midName',align:'center', title: '二级职位', templet:"#midName"}
                    ,{field:'smallName',align:'center', title: '三级职位'}
                    ,{field:'ishot',align:'center', title: '是否热门', templet:"#hotTpl",unresize: true}
                    ,{fixed: 'right', width:100, align:'center', toolbar: '#barDemo',title:'操作'}
                ]]
                ,id: 'testReload'
                ,data: result.extend.jobClass
                ,page: true
                ,height: 450
            });;

            layui.form.on('switch(ishot)', function(obj){
                if (obj.elem.checked == true){
                    $.ajax({
                        url:"${APP_PATH}/admin_updateHot",
                        data:{"smallId":this.value,"ishot":"1"},
                    })
                }else{
                    $.ajax({
                        url:"${APP_PATH}/admin_updateHot",
                        data:{"smallId":this.value,"ishot":"0"},
                    })
                }
            });

        });
    }



    layui.use(['laydate','form','table'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;

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
            function() {
                //发异步，把数据提交给后台
                var searchName = $("option:selected").val();
                var searchVal = $("#search_val").val();
                $.ajax({
                    url:"${APP_PATH}/search_position",
                    data:{"searchName":searchName,"searchVal":searchVal},
                    type:"POST",
                    success:function (result) {
                        position_list(result);
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


    /*分类-删除*/
    function member_del(id){
        layer.confirm('确认要删除该分类吗？',function(index){
            //发异步删除数据
            $.ajax({
                url:"${APP_PATH}/admin_classDel",
                data:"smallId="+id,
                type:"POST",
                success:function (result) {
                    if (result.code == 100) {
                        layer.msg('已删除!',{icon:1,time:1000},function () {
                            jobClass_list(result)
                        })
                    }
                }
            })
        });
    }


    function delAll () {
        var ids = [];
        // 获取选中的id
        $("tbody input[name='layTableCheckbox']").each(function(index, el) {
            if($(this).prop('checked')){
                ids.push($(this).parents("tr").children('td').eq(1).children().text())
            }
        });

        if (ids.length == 0){
            layer.alert("没有分类被选中！")
        }else{
            layer.confirm('确认要删除这些分类吗？',function(index){
                //捉到所有被选中的，发异步进行删除
                $.ajax({
                    url:"${APP_PATH}/admin_classesDel",
                    data:"classIds="+ids,
                    type:"POST",
                    success:function (result) {
                        if (result.code == 100) {
                            layer.msg('已删除!',{icon:1,time:1000},function () {
                                jobClass_list(result)
                            })
                        }
                    }
                })
            });
        }
    }

    //修改用户信息
    function class_edit(smallId){
        xadmin.open('编辑','class_edit?smallId='+smallId,400,300)
    }

</script>
</html>