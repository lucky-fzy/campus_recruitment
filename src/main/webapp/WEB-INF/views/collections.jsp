<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>我收藏的职位-招聘服务</title>
    <link href="style/css/style.css" type="text/css" rel="stylesheet">
    <link href="style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="style/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
    <script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
</head>
<body>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a class="logo" href="home">
                <img width="229" height="43" alt="校园招-专注大学生实习招聘" src="style/images/logo.png">
            </a>
            <ul id="navheader" class="reset">
                <li><a href="home">首页</a></li>
                <li><a href="companylist">公司</a></li>
                <li><a target="_blank" href="yanzhi">言职</a></li>
                <li><a rel="nofollow" href="jianli">我的简历</a></li>
            </ul>
            <dl class="collapsible_menu">
                <dt>
                    <c:if test="${sessionScope.emp.empName == ''}">
                        <span>${sessionScope.emp.email}&nbsp;</span>
                    </c:if>
                    <span>${sessionScope.emp.empName}&nbsp;</span>
                    <span class="red dn" id="noticeDot-0"></span>
                    <i></i>
                </dt>
                <dd><a rel="nofollow" href="jianli">我的简历</a></dd>
                <dd><a href="collections">我收藏的职位</a></dd>
                <dd><a href="accountBind">帐号设置</a></dd>
                <dd class="logout"><a rel="nofollow" href="quit">退出</a></dd>
            </dl>
        </div>
    </div><!-- end #header -->
    <div id="container">

        <div class="clearfix">
            <div class="content_l">
                <dl class="c_collections">
                    <dt>
                        <h1><em></em>我收藏的职位</h1>
                    </dt>
                    <c:if test="${positions.size() == 0}">
                        <dd>
                            <h2 align="center">暂无收藏的职位</h2>
                        </dd>
                    </c:if>
                    <c:if test="${positions.size() != 0}">
                        <dd>
                            <form id="collectionsForm">
                                <ul class="reset my_collections">
                                    <c:forEach items="${positions}" var="position">
                                        <li>
                                            <a title="${position.company.companyName}" href="companyhome?companyId=${position.company.companyId}">
                                                <img alt="${position.company.companyName}" src="${position.company.companyLogo}">
                                            </a>
                                            <div class="co_item">
                                                <h2 title="${position.positionName}">
                                                    <a target="_blank" href="javascript:post('jobdetail',{positionId:${position.positionId}})" target="_blank">
                                                        <em>${position.positionName}</em>
                                                        <span>（${position.minSalary}k-${position.maxSalary}k）</span>
                                                    </a>
                                                </h2>
                                                <span class="co_time">发布时间：${position.releaseTime}</span>
                                                <div class="co_cate">${position.company.companyName} / ${position.jobCity} / ${position.jobExperience} / ${position.degree}</div>
                                                <span class="co_youhuo c7">${position.positionTemptation}</span>
                                                <a class="collection_link" href="javascript:post('jobdetail',{positionId:${position.positionId}})">投个简历</a>
                                                <i></i>
                                                <a class="collectionCancel collection_link collected" onclick="offCollect(${position.positionId},${sessionScope.emp.empId})">
                                                    取消收藏
                                                </a>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </form>
                        </dd>
                    </c:if>
                </dl>
            </div>
            <div class="content_r">
                <div class="mycenterR" id="myInfo">
                    <h2>我的信息</h2>
                    <a href="collections">我收藏的职位</a>
                    <br>
                    <a href="javascript:post('delivery',{type:-1})">已投递简历状态</a>
                </div><!--end #myInfo-->
                <div class="greybg qrcode mt20">
                    <img width="242" height="242" alt="拉勾微信公众号二维码" src="style/images/qr_delivery.png">
                    <span class="c7">扫描拉勾二维码，微信轻松搜工作</span>
                </div>
            </div>
        </div>
        <script src="style/js/collections.min.js"></script>
        <script>
            $(function () {
                $('.Pagination').pager({
                    currPage: 1,
                    pageNOName: "pageNo",
                    form: "collectionsForm",
                    pageCount: 1,
                    pageSize: 5
                });
            });
        </script>
        <div class="clear"></div>
        <input type="hidden" value="4c6ae41d8c254f91becdb5f9ef2d4394" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop"></a>
    </div><!-- end #container -->
</div><!-- end #body -->
<div id="footer">
    <div class="wrapper">
        <a rel="nofollow" target="_blank" href="h/about.html">联系我们</a>
        <a target="_blank" href="h/af/zhaopin.html">互联网公司导航</a>
    </div>
</div>

<script src="style/js/core.min.js" type="text/javascript"></script>
<script src="style/js/popup.min.js" type="text/javascript"></script>

<!--  -->
<script>

    function offCollect(positionId,empId) {
        $.ajax({
            url:"offCollect",
            data:{positionId:positionId,
                    empId:empId},
            type:"POST",
            success:function () {
                location.reload()
            }
        })
    }

    /**
     * 功能：post方式提交
     * 参数列表：url：提交的地址；params：参数列表
     */
    function post(url, params) {
        var temp = document.createElement("form"); //创建form表单
        temp.action = url;
        temp.method = "post";
        temp.style.display = "none";//表单样式为隐藏
        for (var item in params) {//初始化表单内部的控件
            //根据实际情况创建不同的标签元素
            var opt =document.createElement("input");  //添加input标签
            opt.type="text";   //类型为text
            opt.id = item;      //设置id属性
            opt.name = item;    //设置name属性
            opt.value = params[item];   //设置value属性
            temp.appendChild(opt);
        }

        document.body.appendChild(temp);
        temp.submit();
        return temp;
    }
</script>
</body>
</html>