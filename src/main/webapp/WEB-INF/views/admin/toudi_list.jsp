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
                                <div class="layui-input-inline layui-show-xs-block" style="width: 100px">
                                    <select name="contrller" id="contrller" lay-filter="contrller">
                                        <option value=-1>投递进度</option>
                                        <option value=0>未处理</option>
                                        <option value=1>通知面试</option>
                                        <option value=3>待定</option>
                                        <option value=2>不合适</option>
                                        <option value=4>公司删除</option>
                                    </select>
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input id="search_val" type="text"  placeholder="请输入公司名" autocomplete="off" class="layui-input">
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
        {{d.resume.emp.empName}}
    </script>

    <script type="text/html" id="positionTpl">
        {{d.position.positionName}}
    </script>

    <script type="text/html" id="companyTpl">
        {{d.position.company.companyName}}
    </script>

    <script type="text/html" id="toudiTpl">
        {{#  if(d.toudiType === 1){ }}
        <button class="layui-btn">已通知面试</button>
        {{#  } else if(d.toudiType === 2){ }}
        <button class="layui-btn layui-btn-danger" style="width: 80px">不合适</button>
        {{#  } else if(d.toudiType === 3){ }}
        <button class="layui-btn layui-btn-warm" style="width: 80px">待定</button>
        {{#  } else if(d.toudiType === 0){ }}
        <button class="layui-btn layui-btn-normal" style="width: 80px">未处理</button>
        {{#  } else if(d.toudiType === 4){ }}
        <button class="layui-btn" style="width: 80px;border: 1px solid #e6e6e6;background-color: #FBFBFB;color: #C9C9C9;">已失效</button>
        {{#  }  }}
    </script>

    <script type="text/html" id="barDemo">
        {{#  if(d.toudiType === 1){ }}
        <a title="删除" href="javascript:;" onclick="clearToudi(this)">
            <i class="layui-icon">&#xe640;</i>
        </a>

        {{#  } else if(d.toudiType === 2){ }}
        <a title="删除" href="javascript:;" onclick="clearToudi(this)">
            <i class="layui-icon">&#xe640;</i>
        </a>

        {{#  } else if(d.toudiType === 3){ }}
        <a  title="通知面试" href="javascript:;" onclick="notice(this)">
            <i class="iconfont" style="color: #009688">&#xe6b1;</i>
        </a>&nbsp;&nbsp;
        <a  title="不合适" href="javascript:;" onclick="improper(this)">
            <i class="iconfont" style="color: #FF5722">&#xe6b7;</i>
        </a>

        {{#  } else if(d.toudiType === 0){ }}
        <a  title="通知面试" href="javascript:;" onclick="notice(this)">
            <i class="iconfont" style="color: #009688">&#xe6b1;</i>
        </a>&nbsp;&nbsp;
        <a  title="不合适" href="javascript:;" onclick="improper(this)">
            <i class="iconfont" style="color: #FF5722">&#xe6b7;</i>
        </a>&nbsp;&nbsp;
        <a  title="待定" href="javascript:;" onclick="daiding(this)">
            <i class="iconfont" style="color: #FFB800;">&#xe6a4;</i>
        </a>

        {{#  } else if(d.toudiType === 4){ }}
        <button  class="layui-btn layui-btn-xs layui-btn-normal" onclick="toudi_del(this)">彻底删除</button>
        {{#  }  }}
    </script>
    <script>


        $(function () {
            $.ajax({
                url:"${APP_PATH}/admin_toudiList",
                datatype:"JSON",
                success:function (result) {
                    console.log(result)
                    //加载求职者列表
                    toudi_list(result);
                }
            })

        })

        function toudi_list(result){
            layui.use('table', function(){
                var table = layui.table;
                //方法级渲染
                table.render({
                    elem: '#LAY_table_user'
                    ,cols: [[{field:'toudiId',align:'center', title: 'ID', width:80, sort: true, fixed: true}
                        ,{field:'empId',align:'center', title: '求职者姓名',templet:'#empNameTpl'}
                        ,{field:'positionId',align:'center', title: '招聘职位',templet:'#positionTpl'}
                        ,{field:'positionId',align:'center', title: '公司名',templet:'#companyTpl'}
                        ,{field:'toudiDate',align:'center', title: '投递时间', sort: true}
                        ,{field:'toudiType',align:'center', title: '投递进度',templet:'#toudiTpl'}
                        ,{fixed: 'right', width:178, align:'center', toolbar: '#barDemo',title:'操作'}
                    ]]
                    ,id: 'testReload'
                    ,data: result.extend.toudis
                    ,page: true
                    ,height: 450
                });

            });
        }



      layui.use(['laydate','form','table'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;

          //监听select
          form.on('select(contrller)',function (data) {
              $.ajax({
                  url:"admin_searchToudi",
                  data:{
                      toudiType:data.value,
                      companyName:$("#search_val").val()
                  },
                  type:"POST",
                  success:function (result) {
                      toudi_list(result)
                  }
              })
              form.render('select');
          });

          //监听提交
          form.on('submit(search)',
              function(data) {
                  console.log(data);
                  //发异步，把数据提交给后台
                  var toudiType = $("#contrller").val();
                  var companyName = $("#search_val").val();
                  $.ajax({
                      url:"${APP_PATH}/admin_searchToudi",
                      data:{companyName:companyName,
                            toudiType:toudiType},
                      type:"POST",
                      success:function (result) {
                          toudi_list(result);
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

      /*从公司端删除投递信息*/
      function clearToudi(obj){
          var id = $(obj).parents("tr").children('td').eq(0).children().text();
          layer.confirm('确认后该投递信息将失效',function(index){
              //发异步更新数据
              $.ajax({
                  url:"${APP_PATH}/admin_toudiUpdate",
                  data:{toudiId:id,toudiType:4},
                  type:"POST",
                  success:function (result) {
                      if (result.code == 100) {
                           layer.msg('已失效!',{icon:1,time:1000})
                          toudi_list(result)
                      }
                  }
              })
          });
      }

      function notice(data) {
          var id = $(data).parents("tr").children('td').eq(0).children().text();
          $.ajax({
              url:"${APP_PATH}/admin_toudiUpdate",
              data:{toudiId:id,toudiType:1},
              type:"POST",
              success:function (result) {
                  if (result.code == 100) {
                      layer.msg('已通知面试!',{icon:1,time:1000})
                      toudi_list(result)
                  }
              }
          })
      }

      function improper(data) {
          var id = $(data).parents("tr").children('td').eq(0).children().text();
          layer.confirm('确定求职者不适合该职位吗？',function(index){
              //发异步更新数据
              $.ajax({
                  url:"${APP_PATH}/admin_toudiUpdate",
                  data:{toudiId:id,toudiType:2},
                  type:"POST",
                  success:function (result) {
                      if (result.code == 100) {
                          layer.msg('已标记为不合适!',{icon:1,time:1000})
                          toudi_list(result)
                      }
                  }
              })
          });
      }

      function toudi_del(data) {
          var id = $(data).parents("tr").children('td').eq(0).children().text();
          layer.confirm('确定从数据库中删除吗？',function(index){
              //发异步更新数据
              $.ajax({
                  url:"${APP_PATH}/admin_toudiDel",
                  data:{toudiId:id},
                  type:"POST",
                  success:function (result) {
                      if (result.code == 100) {
                          layer.msg('已删除!',{icon:1,time:1000})
                          toudi_list(result)
                      }
                  }
              })
          });
      }

      function daiding(data) {
          var id = $(data).parents("tr").children('td').eq(0).children().text();
          $.ajax({
              url:"${APP_PATH}/admin_toudiUpdate",
              data:{toudiId:id,toudiType:3},
              type:"POST",
              success:function (result) {
                  if (result.code == 100) {
                      layer.msg('已待定!',{icon:1,time:1000})
                      toudi_list(result)
                  }
              }
          })
      }
    </script>
</html>