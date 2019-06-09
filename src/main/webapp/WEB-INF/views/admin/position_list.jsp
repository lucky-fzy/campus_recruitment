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
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-input-inline layui-show-xs-block" style="width: 100px">
                            <select name="contrller" id="contrller">
                                <option value="companyName">公司名</option>
                                <option value="positionName">职位名</option>
                            </select>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input id="search_val" type="text"  placeholder="请输入..." autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button id="search_btn" class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
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

<script type="text/html" id="companyNameTpl">
    {{d.company.companyName}}
</script>

<script type="text/html" id="onlineTpl">
    <input type="checkbox" name="online" value="{{d.positionId}}" lay-skin="switch" lay-text="已上线|未上线" lay-filter="isOnline" {{ d.isOnline == '1' ? 'checked' : '' }}>
</script>

<script type="text/html" id="barDemo">
    <a onclick="position_edit('{{ d.positionId }}')" title="编辑" href="javascript:;" class="edit_emp">
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a title="删除" onclick="member_del('{{ d.positionId }}')" href="javascript:;">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>
<script>


    $(function () {

        $.ajax({
            url:"${APP_PATH}/admin_positionList",
            datatype:"JSON",
            success:function (result) {
                console.log(result)
                //加载职位列表
                position_list(result);
            }
        })

    })

    function position_list(result){
        layui.use('table', function(){
            var table = layui.table;
            //方法级渲染
            table.render({
                elem: '#LAY_table_position'
                ,cols: [[
                    {checkbox: true, fixed: true}
                    ,{field:'positionId',align:'center', title: 'ID', width:80, sort: true, fixed: true}
                    ,{field:'positionName',align:'center', title: '职位名', width:120}
                    ,{field:'department',align:'center', title: '所属部门', width:80}
                    ,{field:'jobType',align:'center', title: '工作类型', width:80}
                    ,{field:'jobCity',align:'center', title: '工作城市'}
                    ,{field:'degree',align:'center', title: '学历要求'}
                    ,{field:'positionDescribe',align:'center', title: '职位描述'}
                    ,{field:'minSalary',align:'center', title: '最低薪资', sort: true}
                    ,{field:'maxSalary',align:'center', title: '最高薪资', sort: true}
                    ,{field:'releaseTime',align:'center', title: '发布时间'}
                    ,{field:'companyId',align:'center', title: '招聘公司', width:100, templet:"#companyNameTpl"}
                    ,{field:'isOnline',align:'center', title: '是否上线', width:120, templet:"#onlineTpl",unresize: true}
                    ,{fixed: 'right', width:100, align:'center', toolbar: '#barDemo',title:'操作'}
                ]]
                ,id: 'testReload'
                ,data: result.extend.positions
                ,page: true
                ,height: 450
            });;

            layui.form.on('switch(isOnline)', function(obj){
                if (obj.elem.checked == true){
                    $.ajax({
                        url:"${APP_PATH}/admin_updateOnline",
                        data:{"positionId":this.value,"isOnline":"1"},
                        success:function () {
                            layer.tips("已上线",obj.othis)
                        }
                    })
                }else{
                    $.ajax({
                        url:"${APP_PATH}/admin_updateOnline",
                        data:{"positionId":this.value,"isOnline":"0"},
                        success:function () {
                            layer.tips("已下线",obj.othis)
                        }
                    })
                }
                // layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
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


    /*职位-删除*/
    function member_del(id){
        layer.confirm('确认要删除该职位吗？',function(index){
            //发异步删除数据
            $.ajax({
                url:"${APP_PATH}/admin_positionDel",
                data:"positionId="+id,
                type:"POST",
                success:function (result) {
                    if (result.code == 100) {
                        layer.msg('已删除!',{icon:1,time:1000},function () {
                            position_list(result)
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
            layer.alert("没有职位被选中！")
        }else{
            layer.confirm('确认要删除这些职位吗？',function(index){
                //捉到所有被选中的，发异步进行删除
                $.ajax({
                    url:"${APP_PATH}/admin_positionsDel",
                    data:"positionIds="+ids,
                    type:"POST",
                    success:function (result) {
                        if (result.code == 100) {
                            layer.msg('已删除!',{icon:1,time:1000},function () {
                                position_list(result)
                            })
                        }
                    }
                })
            });
        }
    }

    //修改职位信息
    function position_edit(positionId){
        xadmin.open('编辑','position_edit?positionId='+positionId,600,550)
    }

</script>
</html>