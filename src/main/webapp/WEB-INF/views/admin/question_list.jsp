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
                            <input id="search_val" type="text"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
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
                    <table class="layui-hide" id="LAY_table_question" lay-filter="question"></table>
                </div>

            </div>
        </div>
    </div>
</div>
</body>

<%--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>

<script type="text/html" id="nameTpl">
    {{ d.emp.empName }}
</script>

<script type="text/html" id="barDemo">
    <a onclick="question_edit('{{ d.questionId }}')" title="编辑" href="javascript:;" class="edit_question">
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a title="删除" onclick="member_del('{{ d.questionId }}')" href="javascript:;">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>
<script>


    $(function () {
        $.ajax({
            url:"${APP_PATH}/admin_questionList",
            datatype:"JSON",
            success:function (result) {
                console.log(result)
                //加载问题列表
                question_list(result);
            }
        })
    })

    function question_list(result){
        layui.use('table', function(){
            var table = layui.table;
            //方法级渲染
            table.render({
                elem: '#LAY_table_question'
                ,cols: [[
                    {checkbox: true, fixed: true}
                    ,{field:'questionId', align:'center', title: 'ID', width:80, sort: true, fixed: true}
                    ,{field:'empId', align:'center', title: '提出者', templet:'#nameTpl'}
                    ,{field:'questionName', align:'center', title: '问题'}
                    ,{field:'questionContent', title: '问题补充',align:'center'}
                    ,{field:'questionDate', align:'center', title: '提出时间', sort: true,}
                    ,{fixed: 'right', align:'center', toolbar: '#barDemo',title:'操作'}
                ]]
                ,id: 'testReload'
                ,data: result.extend.questions
                ,page: true
                ,height: 450
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
            function(data) {
                console.log(data);
                //发异步，把数据提交给后台
                var searchVal = $("#search_val").val();
                $.ajax({
                    url:"${APP_PATH}/search_question",
                    data:{"empName":searchVal},
                    type:"POST",
                    success:function (result) {
                        question_list(result);
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
        layer.confirm('确认要删除此问题吗',function(index){
            //发异步删除数据
            $.ajax({
                url:"${APP_PATH}/admin_questionDel",
                data:"questionId="+id,
                type:"POST",
                success:function (result) {
                    if (result.code == 100) {
                        layer.msg('已删除!',{icon:1,time:1000},function () {
                            question_list(result)
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
            layer.alert("没有问题被选中！")
        }else{
            layer.confirm('确认要删除这些问题吗',function(index){
                //捉到所有被选中的，发异步进行删除
                $.ajax({
                    url:"${APP_PATH}/admin_questionsDel",
                    data:"questionIds="+ids,
                    type:"POST",
                    success:function (result) {
                        if (result.code == 100) {
                            layer.msg('已删除!',{icon:1,time:1000},function () {
                                question_list(result)
                            })
                        }
                    }
                })
            });
        }
    }

    //修改用户信息
    function question_edit(questionId){
        xadmin.open('编辑','question_edit?questionId='+questionId,600,400)
    }

</script>
</html>