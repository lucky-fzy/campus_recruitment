<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>校园招后台管理</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="${APP_PATH}/style/admin/css/font.css">
        <link rel="stylesheet" href="${APP_PATH}/style/admin/css/xadmin.css">
        <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
        <script src="${APP_PATH}/style/admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${APP_PATH}/style/admin/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
            // 是否开启刷新记忆tab功能
            // var is_remember = false;
        </script>
    </head>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="admin">校园招后台管理</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">${sessionScope.admin.adminName}</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a href="quit_admin">退出</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item to-index">
                    <a href="home">前台首页</a></li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="用户信息管理">&#xe6b8;</i>
                            <cite>用户信息管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('求职者信息','emp_list')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>求职者信息</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('公司信息','company_list')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>公司信息</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a  onclick="xadmin.add_tab('公司认证审核','authentication_list')">
                            <i class="iconfont left-nav-li" lay-tips="公司认证审核">&#xe723;</i>
                            <cite>公司认证审核</cite>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="职位管理">&#xe723;</i>
                            <cite>职位管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('职位详情','position_list')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>职位详情</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('职位分类','job_class')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>职位分类</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('收藏管理','collect_list')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>收藏管理</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="简历管理">&#xe753;</i>
                            <cite>简历投递管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('求职者简历','resume_list')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>求职者简历</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('投递进度管理','toudi_list')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>投递进度管理</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="评论管理">&#xe69b;</i>
                            <cite>评论管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('已发布话题','question_list')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>已发布话题</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('留言评论','comment_list')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>留言评论</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a  onclick="xadmin.add_tab('广告管理','ad_list')">
                            <i class="iconfont left-nav-li" lay-tips="广告管理">&#xe696;</i>
                            <cite>广告管理</cite>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd></dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
        <script>//百度统计可去掉
            var _hmt = _hmt || []; (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();</script>
    </body>

</html>