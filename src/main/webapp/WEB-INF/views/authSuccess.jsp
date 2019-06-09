<!DOCTYPE HTML>
<html>
<head>
    <script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>申请认证</title>
    <link href="style/css/style.css" type="text/css" rel="stylesheet">
    <link href="style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="style/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
    <script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
    <script src="style/js/additional-methods.js" type="text/javascript"></script>
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
                <li class="current"><a href="companylist">公司</a></li>
                <li><a target="_blank" href="yanzhi">言职</a></li>
                <li><a rel="nofollow" href="create">招聘管理</a></li>
            </ul>
            <dl class="collapsible_menu">
                <dt>
                    <span>个人中心&nbsp;</span>
                    <i></i>
                </dt>
                <dd style="display: none;"><a href="javascript:post('positions',{isOnline:1})">我发布的职位</a></dd>
                <dd style="display: none;"><a href="javascript:post('select_Resumes',{type:0})">我收到的简历</a></dd>
                <dd class="btm" style="display: none;"><a href="myhome">我的公司主页</a></dd>
                <dd style="display: none;"><a href="accountBind">帐号设置</a></dd>
                <dd class="logout" style="display: none;"><a rel="nofollow" href="quit">退出</a></dd>
            </dl>
        </div>
    </div><!-- end #header -->
    <div id="container">

        <div class="content_mid">
            <dl class="c_section c_section_mid">
                <dt>
                    <h2><em></em>申请公司认证</h2>
                </dt>
                <dd class="c_certify">
                    <h4>公司认证已提交，请等待审核</h4>
                    <div class="f16 mb20">收到资料后我们将在24小时内进行人工审核，并将审核结果发送至你的邮箱，
                        请耐心等待O(∩_∩)O~
                    </div>
                    <div class="certify_notice">
                        <ul>
                            <li class="lista">若通过审核 <span>[ 您将在公司详情页的简称右侧查看到【认证徽章】点亮 ]</span></li>
                            <li class="listb">若未通过审核 <span> [ 我们将以邮件的形式写清楚未通过审核的原因，您可以整理好所需资料重新提交审核 ]</span></li>
                        </ul>
                    </div>
                    <div class="breakdotted"></div>
                    <a class="greenlink" href="create">发布新职位</a>
                    <a class="greenlink" href="myhome"> 进入我的公司主页</a>
                </dd>
            </dl>
        </div>

        <div class="clear"></div>
        <input type="hidden" value="" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
    </div><!-- end #container -->
</div><!-- end #body -->
<div id="footer">
    <div class="wrapper">
        <a rel="nofollow" target="_blank" href="about.html">联系我们</a>
        <a target="_blank" href="http://www.lagou.com/af/zhaopin.html">互联网公司导航</a>
    </div>
</div>

<script src="style/js/core.min.js" type="text/javascript"></script>
<script src="style/js/popup.min.js" type="text/javascript"></script>
<script>
    $(function () {

        if (window.history && window.history.pushState) {
            $(window).on('popstate', function () {
                window.history.pushState('forward', null, '#');
                window.history.forward(1);
            });
        }
        window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
        window.history.forward(1);
    })
</script>
</body>
</html>