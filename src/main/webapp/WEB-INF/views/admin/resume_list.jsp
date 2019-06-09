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
                        <div class="layui-card-body " align="center">
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
                        <div class="layui-card-body ">
                            <table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>


    <%--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>

    <script type="text/html" id="empNameTpl">
        {{d.emp.empName}}
    </script>

    <script type="text/html" id="checkResume">
        <button class="layui-btn layui-btn-normal" onclick="cheakResume(this)">查看</button>
    </script>

    <script type="text/html" id="barDemo">
        <button class="layui-btn layui-btn-danger" onclick="clearResume(this)">清空简历</button>
    </script>
    <script>


        $(function () {
            $.ajax({
                url:"${APP_PATH}/admin_resumeList",
                datatype:"JSON",
                success:function (result) {
                    console.log(result)
                    //加载求职者列表
                    resume_list(result);
                }
            })

        })

        function resume_list(result){
            layui.use('table', function(){
                var table = layui.table;
                //方法级渲染
                table.render({
                    elem: '#LAY_table_user'
                    ,cols: [[
                         {field:'resumeId',align:'center', title: 'ID', width:80, sort: true, fixed: true}
                        ,{field:'empId',align:'center', title: '求职者姓名',templet:'#empNameTpl'}
                        ,{align:'center', toolbar:'#checkResume', title: '简历'}
                        ,{fixed: 'right', width:178, align:'center', toolbar: '#barDemo',title:'操作'}
                    ]]
                    ,id: 'testReload'
                    ,data: result.extend.resumes
                    ,page: true
                    ,height: 450
                });
            });
        }



      layui.use(['laydate','form','table'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;

          //监听提交
          form.on('submit(search)',
              function(data) {
                  console.log(data);
                  //发异步，把数据提交给后台
                  var empName = $("#search_val").val();
                  $.ajax({
                      url:"${APP_PATH}/search_resume",
                      data:{empName:empName},
                      type:"POST",
                      success:function (result) {
                          resume_list(result);
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


      /*简历-清空*/
      function clearResume(obj){
          var id = $(obj).parents("tr").children('td').eq(0).children().text();
          layer.confirm('确认要清空该简历吗？',function(index){
              //发异步删除数据
              $.ajax({
                  url:"${APP_PATH}/admin_resumeClean",
                  data:"resumeId="+id,
                  type:"POST",
                  success:function (result) {
                      console.log(result)
                      if (result.code == 100) {
                           layer.msg('已清空!',{icon:1,time:1000})
                      }
                  }
              })
          });
      }

      function cheakResume(data) {
          var resumeId = $(data).parents("tr").children('td').eq(0).children().text();
          xadmin.open('查看简历','cheakResume?resumeId='+resumeId,800,600)
      }

    </script>
</html>